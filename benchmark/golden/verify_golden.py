#!/usr/bin/env python3
"""Verify the golden reference designs (hand designs) with the benchmark evaluator.

  python benchmark/golden/verify_golden.py

Each benchmark/golden/<circuit>_<1v8|1v2>.sp is rule-checked (same checker as the LLM answers) and simulated
with evaluate.py at its supply (test conditions unchanged). Each benchmark/golden/<circuit>_<profile>.sp is checked
against circuits/<circuit>/profiles/<profile>.yaml and, to show that the profiles need different designs, also
against every other profile of that circuit. Writes benchmark/golden/results.json.
"""
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(HERE.parent), str(HERE.parent / "llm")]
from check_netlist import check   # noqa: E402
from circuits import CIRCUITS     # noqa: E402
from evaluate import evaluate     # noqa: E402

out = {}
for f in sorted(HERE.glob("*_1v[28].sp")):
    circuit, vtag = f.stem.rsplit("_", 1)
    vdd = 1.8 if vtag == "1v8" else 1.2
    _, unsafe, viol, _ = check(f.read_text(), CIRCUITS[circuit]["ports"])
    r = evaluate(circuit, f, "sky130_lvt", vdd, label=f"golden/{f.stem}")
    out[f.stem] = {"circuit": circuit, "vdd": vdd, "pass": bool(r.get("pass")) and not viol and not unsafe,
                   "rule_violations": viol, "metrics": r["metrics"],
                   "checks": [{k: c[k] for k in ("metric", "value", "op", "limit", "pass")} for c in r.get("checks", [])]}
    fails = [c["metric"] for c in r.get("checks", []) if not c["pass"]]
    print(f"{f.stem:20s} {'PASS' if out[f.stem]['pass'] else 'FAIL'}  {fails or ''} {viol or ''}")

# spec-profile designs: own profile decides pass; the other profiles are reported as a cross-check
for f in sorted(HERE.glob("*_p[0-9]*.sp")):
    circuit = next(c for c in CIRCUITS if f.stem.startswith(c + "_"))
    own = f.stem[len(circuit) + 1:]
    _, unsafe, viol, _ = check(f.read_text(), CIRCUITS[circuit]["ports"])
    cross = {}
    for pf in sorted((HERE.parent / "circuits" / circuit / "profiles").glob("*.yaml")):
        r = evaluate(circuit, f, "sky130_lvt", label=f"golden/{f.stem}/{pf.stem}", spec=pf)
        cross[pf.stem] = {"pass": bool(r.get("pass")) and not viol and not unsafe,
                          "fails": [c["metric"] for c in r.get("checks", []) if not c["pass"]]}
        if pf.stem == own:
            out[f.stem] = {"circuit": circuit, "profile": own, "vdd": r["vdd"], "pass": cross[own]["pass"],
                           "rule_violations": viol, "metrics": r["metrics"],
                           "checks": [{k: c[k] for k in ("metric", "value", "op", "limit", "pass")} for c in r.get("checks", [])]}
    out[f.stem]["other_profiles"] = {k: v for k, v in cross.items() if k != own}
    print(f"{f.stem:32s} {'PASS' if out[f.stem]['pass'] else 'FAIL'}  {cross[own]['fails'] or ''} {viol or ''}   "
          + "  ".join(f"{k}: {'pass' if v['pass'] else 'fail'}" for k, v in cross.items() if k != own))
(HERE / "results.json").write_text(json.dumps(out, indent=2))
print(f"{sum(v['pass'] for v in out.values())}/{len(out)} golden designs pass")
