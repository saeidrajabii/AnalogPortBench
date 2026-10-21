#!/usr/bin/env python3
"""Score one answer to one task, exactly as in the paper (TT corner, 27 C).

  python benchmark/llm/score_answer.py <task id> <answer file>
  python benchmark/llm/score_answer.py T2__ota_tele__p0_as_source my_answer.txt

The answer file is either the model's full reply (the netlist is taken from the first code block that defines
`.subckt dut`) or a bare netlist. Task ids are the file names in prompts/ without .txt.

Outcome: P = meets every limit; F = works but misses a limit; D = does not work (no gain, or a current error above
50 %); I = invalid (no netlist, a netlist check or benchmark-rule violation, or a simulation error). On T4 tasks the
right answer is a line starting with `INFEASIBLE:`, which is reported separately.
"""
import argparse
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(HERE.parent), str(HERE)]
import config                                               # noqa: E402
from check_netlist import benchmark_rules, check, extract   # noqa: E402
from circuits import CIRCUITS                               # noqa: E402
from evaluate import evaluate                               # noqa: E402
from tasks_v2 import all_tasks                              # noqa: E402


def dead(m):
    """Circuit does not work at all: no gain (amplifiers) or no output current (mirrors, bias circuits)."""
    g = m.get("dc_gain_dB", 1.0)
    if g is None or g <= 0:
        return True
    return any(abs(m.get(k) or 0) > 50 for k in ("iout_err_pct", "isink_err_pct", "isource_err_pct"))


def score(task, reply):
    tier, circuit, spec, vdd = all_tasks()[task]
    ports = CIRCUITS[circuit]["ports"]
    res = {"task": task, "tier": tier, "infeasible_flag": bool(re.search(r"^\s*INFEASIBLE:", reply, re.M))}
    netlist, _ = extract(reply)
    if netlist is None and re.search(r"^\s*\.subckt\s+dut\b", reply, re.I | re.M):
        netlist = reply                                     # a bare netlist
    if netlist is None:
        return {**res, "outcome": "I", "why": ["no netlist"]}
    cleaned, unsafe, viol, _ = check(netlist, ports)
    if unsafe:
        return {**res, "outcome": "I", "why": [f"unsafe statement: {u}" for u in unsafe]}
    viol += benchmark_rules(cleaned, ports)
    out = config.BUILD / "score_answer" / task
    out.mkdir(parents=True, exist_ok=True)
    (out / "netlist.sp").write_text(cleaned)
    r = evaluate(circuit, out / "netlist.sp", "sky130_lvt", vdd, "tt", label=f"score_answer/{task}", spec=spec)
    m = r["metrics"]
    if (m.get("input_current_uA") or 0) > 1.0:            # benchmark rule (iii)
        viol.append(f"draws {m['input_current_uA']} uA from the input source (> 1 uA)")
    fails = [c["metric"] for c in r.get("checks", []) if not c["pass"]]
    res.update(metrics=m, failed_limits=fails)
    if viol or r["errors"] or not m:
        return {**res, "outcome": "I", "why": viol + r["errors"]}
    if dead(m):
        return {**res, "outcome": "D", "why": fails}
    return {**res, "outcome": "P" if r.get("pass") else "F", "why": fails}


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("task")
    ap.add_argument("answer", type=Path)
    a = ap.parse_args()
    r = score(a.task, a.answer.read_text())
    print(json.dumps(r, indent=1, default=str))


if __name__ == "__main__":
    main()
