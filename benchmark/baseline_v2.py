#!/usr/bin/env python3
"""Baselines on the prompt-v2 task set: the naive port (device swap, keepL) and the golden designs.

  python benchmark/baseline_v2.py        -> results/v2_baselines.json

Each is simulated once per task against the task's own spec at its VDD (TT); verification only, no search.
Golden per task: golden/<c>_1v8.sp (T1), _1v2.sp / _p<k> (T2), the matching _hard_ file (T3); none for T4/T4f.
"""
import json
import sys
from multiprocessing import Pool
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(HERE), str(HERE / "llm")]
import config                       # noqa: E402
from evaluate import evaluate       # noqa: E402
from tasks_v2 import all_tasks      # noqa: E402


def golden_for(tid, tier, c, spec):
    g = config.BENCH / "golden"
    name = Path(spec).stem
    cand = {"T1": g / f"{c}_1v8.sp", "T2": g / (f"{c}_{name}.sp" if name.startswith("p") else f"{c}_1v2.sp"),
            "T3": g / f"{c}_{name}.sp"}.get(tier)
    return cand if cand and cand.exists() else None


def job(a):
    tid, kind, net, c, spec, vdd = a
    r = evaluate(c, net, "sky130_lvt", vdd, "tt", label=f"v2base/{kind}/{tid}", spec=spec)
    return tid, kind, {"pass": bool(r.get("pass")), "errors": r["errors"][:1], "metrics": r["metrics"],
                       "fails": [x["metric"] for x in r.get("checks", []) if not x["pass"]]}


def main():
    jobs = []
    for tid, (tier, c, spec, vdd) in all_tasks().items():
        jobs.append((tid, "naive", config.BENCH / "circuits" / c / "ported" / "sky130_naive_keepL.sp", c, spec, vdd))
        g = golden_for(tid, tier, c, spec)
        if g:
            jobs.append((tid, "golden", g, c, spec, vdd))
    with Pool(10) as p:
        res = p.map(job, jobs)
    out = {}
    for tid, kind, r in res:
        out.setdefault(tid, {})[kind] = r
    (config.BENCH / "results" / "v2_baselines.json").write_text(json.dumps(out, indent=1, default=str))
    for kind in ("naive", "golden"):
        print(kind, sum(v[kind]["pass"] for v in out.values() if kind in v), "/", sum(kind in v for v in out.values()))


if __name__ == "__main__":
    main()
