#!/usr/bin/env python3
"""Simulate one circuit netlist in one technology and check it against the circuit's spec.

  python benchmark/evaluate.py <circuit> <netlist.sp> [--tech sky130_lvt] [--vdd 1.8] [--corner tt]
                               [--label NAME] [--spec circuits/<circuit>/profiles/<p>.yaml]

<netlist.sp> must define `.subckt dut <ports>` with the port list given in circuits.py.
Results go to build/eval/<circuit>/<label>/: one folder per testbench plus result.json.

Checks:
  - every metric with a limit in benchmark/circuits/<circuit>/spec.yaml (PASS/FAIL)
  - headroom: the number of transistors out of saturation at the operating point
    (|Vds| < |Vdsat|) must not exceed the source design's count
  - warnings: NMOS with a bulk not tied to ground (needs a deep n-well in Sky130)
"""
import argparse
import json
import sys
from pathlib import Path
from string import Template

import yaml

import config
from circuits import CIRCUITS
from measure import MEASURE, branch_currents, headroom
from netlist import mos_devices, op_print_lines
from sim import SimError, run_ngspice
from techs import TECHS

TB_DIR = config.BENCH / "testbenches"


def resolve(params, vdd):
    """Testbench parameters may scale with the supply, e.g. VCM: "VDD/2"."""
    return {k: (eval(v, {"VDD": vdd}) if isinstance(v, str) and "VDD" in v else v) for k, v in params.items()}


def build_testbench(tb, params, dut, tech, vdd, corner):
    t = TECHS[tech]
    subs = {"HEADER": t["header"](corner), "VDD": vdd, "IREF": f"{params['IREF_uA']}u",
            **{k: v for k, v in params.items() if k != "IREF_uA"}}
    text = Template((TB_DIR / f"{tb}.cir.tmpl").read_text()).safe_substitute(subs)
    text = text.replace("$DUT", dut)          # inserted last: DUT text may contain '$' comments
    devices = mos_devices(text)
    return text.replace("$OPPRINT", op_print_lines(devices)), devices


def check(value, rule):
    op, limit = rule["op"], rule["limit"]
    if value is None:
        return False
    return {">=": value >= limit, "<=": value <= limit, "abs<=": abs(value) <= limit}[op]


def evaluate(circuit, netlist, tech="sky130_lvt", vdd=None, corner="tt", label=None, spec=None):
    """spec: a spec file other than circuits/<circuit>/spec.yaml (e.g. a profile); its `vdd` is the default VDD."""
    cfg = CIRCUITS[circuit]
    spec_file = Path(spec) if spec else config.BENCH / "circuits" / circuit / "spec.yaml"
    spec_vdd = yaml.safe_load(spec_file.read_text()).get("vdd") if spec else None
    vdd = vdd or spec_vdd or TECHS[tech]["vdd"]
    label = label or f"{Path(netlist).stem}_{tech}_{vdd:g}V_{corner}"
    out = config.BUILD / "eval" / circuit / label
    dut = Path(netlist).read_text()
    res = {"circuit": circuit, "netlist": str(netlist), "tech": tech, "vdd": vdd, "corner": corner,
           "metrics": {}, "errors": [], "warnings": []}

    for tb, params in cfg["testbenches"].items():
        params = resolve(params, vdd)
        text, devices = build_testbench(tb, params, dut, tech, vdd, corner)
        try:
            run_ngspice(text, out / tb, name=tb, spiceinit=TECHS[tech]["spiceinit"])
            res["metrics"].update(MEASURE[tb](out / tb, params, vdd))
            if "headroom" not in res and (out / tb / "op_devices.txt").exists():
                res["headroom"] = headroom(out / tb, devices)
            if tb == "cascode_bias_dc" and "headroom" in res:    # both branches must carry Iref, not just match
                res["metrics"].update(branch_currents(res["headroom"], "nout", params["IREF_uA"]))
        except (SimError, KeyError, ValueError, TypeError, IndexError) as e:
            res["errors"].append(f"{tb}: {type(e).__name__}: {e}")
    if "headroom" in res:
        res["metrics"]["n_triode"] = res["headroom"]["n_triode"]
    res["warnings"] += [f"NMOS {d} bulk tied to '{b}', not ground (needs deep n-well in Sky130)"
                        for d, typ, b, _ in mos_devices(dut + "\nXDUT " + cfg["ports"] + " dut")
                        if typ == "n" and b not in ("0", "gnd", "vss")]

    res["spec"] = str(spec_file)
    if spec_file.exists():
        spec = yaml.safe_load(spec_file.read_text())
        res["checks"] = []
        for m, rule in spec["limits"].items():
            v = res["metrics"].get(m)
            res["checks"].append({"metric": m, "value": v, "op": rule["op"], "limit": rule["limit"],
                                  "source": rule.get("source"), "pass": check(v, rule)})
        res["pass"] = not res["errors"] and all(c["pass"] for c in res["checks"])
    out.mkdir(parents=True, exist_ok=True)
    (out / "result.json").write_text(json.dumps(res, indent=2))
    res["out_dir"] = str(out)
    return res


def print_result(res):
    print(f"== {res['circuit']}  {res['netlist']}  [{res['tech']}, VDD={res['vdd']} V, {res['corner']}]")
    for e in res["errors"]:
        print(f"   ERROR {e}")
    for c in res.get("checks", []):
        v = f"{c['value']:.4g}" if isinstance(c["value"], (int, float)) else str(c["value"])
        print(f"   {'PASS' if c['pass'] else 'FAIL'}  {c['metric']:22s} {v:>10s}  "
              f"{c['op']} {c['limit']:<10g} (180 nm: {c['source']})")
    if "headroom" in res:
        print(f"   triode devices: {res['headroom']['triode_devices'] or 'none'}")
    for w in res["warnings"]:
        print(f"   warning: {w}")
    if "pass" in res:
        print(f"   overall: {'PASS' if res['pass'] else 'FAIL'}")


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("circuit", choices=CIRCUITS)
    ap.add_argument("netlist")
    ap.add_argument("--tech", default="sky130_lvt", choices=TECHS)
    ap.add_argument("--vdd", type=float)
    ap.add_argument("--corner", default="tt")
    ap.add_argument("--label")
    ap.add_argument("--spec", help="spec file to check against (default circuits/<circuit>/spec.yaml)")
    a = ap.parse_args()
    r = evaluate(a.circuit, a.netlist, a.tech, a.vdd, a.corner, a.label, a.spec)
    print_result(r)
    sys.exit(0 if r.get("pass", not r["errors"]) else 1)
