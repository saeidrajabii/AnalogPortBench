#!/usr/bin/env python3
"""Quality audit of every golden design: all five corners plus checks a designer would make.

  python benchmark/golden/audit_golden.py [--procs 10] [name-filter ...]

For each benchmark/golden/<circuit>_<tag>.sp the spec is chosen from the name:
  <c>_1v8 / <c>_1v2        circuits/<c>/spec.yaml at VDD 1.8 / 1.2 V (1.2 V: spec_1v2.yaml if it exists)
  <c>_p<k>_... / <c>_hard_<k>_...   circuits/<c>/profiles/<p or hard name>.yaml (its own vdd)
Each golden is simulated at tt ff ss sf fs (verification only: the same netlist, no sizing changes) and scored:
  pass per corner; worst relative margin of every limit over the corners (>= 5 % wanted);
  minimum saturation margin |Vds| - |Vdsat| over the corners (>= 50 mV wanted);
  step overshoot (rise/fall, <= 10 % wanted, where the testbench measures it);
  total gate area sum(W*L*m) in um^2 (reported); Iref used directly as a transistor source (loophole, flagged).
Writes results/golden_audit.json and results/golden_audit.md.
"""
import argparse
import json
import re
import sys
from multiprocessing import Pool
from pathlib import Path

import yaml

HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(HERE.parent)]
import config                    # noqa: E402
from circuits import CIRCUITS    # noqa: E402
from evaluate import evaluate    # noqa: E402
sys.path.insert(0, str(HERE.parent / "llm"))
from check_netlist import benchmark_rules   # noqa: E402

CORNERS = ["tt", "ff", "ss", "sf", "fs"]
WANT_MARGIN, WANT_SAT_V, WANT_OS = 0.05, 0.05, 10.0


def spec_for(stem):
    circuit = max((c for c in CIRCUITS if stem.startswith(c + "_")), key=len, default=None)
    if circuit is None:
        return None
    tag = stem[len(circuit) + 1:]
    if tag in ("1v8", "1v2"):
        scaled = config.BENCH / "circuits" / circuit / "spec_1v2.yaml"     # range limits scaled to 1.2 V
        if tag == "1v2" and scaled.exists():
            return circuit, scaled, 1.2
        return circuit, config.BENCH / "circuits" / circuit / "spec.yaml", 1.8 if tag == "1v8" else 1.2
    prof = config.BENCH / "circuits" / circuit / "profiles" / f"{tag}.yaml"
    if prof.exists():
        return circuit, prof, yaml.safe_load(prof.read_text())["vdd"]
    return None


def margin(value, rule):
    op, lim = rule["op"], rule["limit"]
    if value is None:
        return None
    if op == ">=":
        return (value - lim) / abs(lim) if lim else value
    if op == "<=":
        return (lim - value) / abs(lim) if lim else -value
    return (lim - abs(value)) / abs(lim)                       # abs<=


def netlist_checks(text, ports):
    area, iref_src = 0.0, []
    iref_ports = [p for p in ports.split() if p in ("iref", "iin")]
    for line in text.splitlines():
        t = line.split()
        if t and t[0][0] in "Xx" and any("fet" in x for x in t):
            kv = dict(re.findall(r"(\w+)=([\d.eE+-]+)", line))
            area += float(kv.get("W", 0)) * float(kv.get("L", 0)) * float(kv.get("m", 1))
            if t[3] in iref_ports:
                iref_src.append(t[0])
    return round(area, 1), iref_src


def job(a):
    f, circuit, spec, vdd, corner = a
    r = evaluate(circuit, f, "sky130_lvt", vdd, corner, label=f"audit/{Path(f).stem}/{corner}", spec=spec)
    return Path(f).stem, corner, r


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("filters", nargs="*")
    ap.add_argument("--procs", type=int, default=10)
    a = ap.parse_args()
    goldens = []
    for f in sorted(HERE.glob("*.sp")):
        s = spec_for(f.stem)
        if s and (not a.filters or any(x in f.stem for x in a.filters)):
            goldens.append((str(f), *s))
    jobs = [(f, c, s, v, k) for f, c, s, v in goldens for k in CORNERS]
    with Pool(a.procs) as p:
        res = p.map(job, jobs)
    by = {}
    for stem, corner, r in res:
        by.setdefault(stem, {})[corner] = r

    report = {}
    for f, circuit, spec, vdd in goldens:
        stem = Path(f).stem
        rs = by[stem]
        limits = yaml.safe_load(Path(spec).read_text())["limits"]
        worst = {}
        for m, rule in limits.items():
            ms = [margin(rs[k]["metrics"].get(m), rule) for k in CORNERS]
            if m == "n_triode":
                continue
            ms = [x for x in ms if x is not None]
            if ms:
                k = CORNERS[[margin(rs[k]["metrics"].get(m), rule) for k in CORNERS].index(min(ms))]
                worst[m] = (round(min(ms), 4), k)
        sat = [rs[k].get("headroom", {}).get("min_sat_margin_V") for k in CORNERS]
        sat = [x for x in sat if x is not None]
        os_ = [rs[k]["metrics"].get(x) for k in CORNERS for x in ("rise_overshoot_pct", "fall_overshoot_pct")]
        os_ = [x for x in os_ if x is not None]
        area, iref_src = netlist_checks(Path(f).read_text(), CIRCUITS[circuit]["ports"])
        iref_src += benchmark_rules(Path(f).read_text(), CIRCUITS[circuit]["ports"])
        corners_pass = {k: bool(rs[k].get("pass")) for k in CORNERS}
        wm = min(worst.items(), key=lambda kv: kv[1][0]) if worst else None
        issues = []
        if not all(corners_pass.values()):
            issues.append("fails at " + ",".join(k for k in CORNERS if not corners_pass[k]))
        if wm and wm[1][0] < WANT_MARGIN:
            issues.append(f"thin margin: {wm[0]} {wm[1][0]:+.1%} at {wm[1][1]}")
        if sat and min(sat) < WANT_SAT_V:
            issues.append(f"saturation margin {min(sat) * 1e3:.0f} mV")
        if os_ and max(os_) > WANT_OS:
            issues.append(f"overshoot {max(os_):.0f} %")
        if iref_src:
            issues.append("rule: " + "; ".join(iref_src))
        report[stem] = {"circuit": circuit, "spec": str(Path(spec).relative_to(config.BENCH)), "vdd": vdd,
                        "corners_pass": corners_pass, "worst_margin": worst, "min_sat_margin_V": min(sat) if sat else None,
                        "max_overshoot_pct": max(os_) if os_ else None, "gate_area_um2": area,
                        "errors": {k: rs[k]["errors"] for k in CORNERS if rs[k]["errors"]}, "issues": issues}
    out = config.BENCH / "results"
    (out / "golden_audit.json").write_text(json.dumps(report, indent=1))
    L = ["# Golden design audit (generated by golden/audit_golden.py)", "",
         f"Every golden at tt ff ss sf fs against its own spec. Wanted: pass at all corners, worst-corner margin "
         f">= {WANT_MARGIN:.0%}, saturation margin >= {WANT_SAT_V * 1e3:.0f} mV, overshoot <= {WANT_OS:.0f} %, "
         "Iref never used directly as a transistor source.", "",
         "| Golden | Spec | VDD | Corners passed | Worst margin (metric, corner) | Min sat. margin | Max overshoot | Gate area µm² | Issues |",
         "|---|---|---|---|---|---|---|---|---|"]
    for stem, r in report.items():
        wm = min(r["worst_margin"].items(), key=lambda kv: kv[1][0]) if r["worst_margin"] else None
        L.append(f"| {stem} | {Path(r['spec']).name} | {r['vdd']} | {sum(r['corners_pass'].values())}/5 | "
                 + (f"{wm[1][0]:+.1%} ({wm[0]}, {wm[1][1]})" if wm else "–") + " | "
                 + (f"{r['min_sat_margin_V'] * 1e3:.0f} mV" if r["min_sat_margin_V"] is not None else "–") + " | "
                 + (f"{r['max_overshoot_pct']:.1f} %" if r["max_overshoot_pct"] is not None else "–")
                 + f" | {r['gate_area_um2']:.0f} | {'; '.join(r['issues']) or 'ok'} |")
    (out / "golden_audit.md").write_text("\n".join(L) + "\n")
    print("\n".join(L))


if __name__ == "__main__":
    main()
