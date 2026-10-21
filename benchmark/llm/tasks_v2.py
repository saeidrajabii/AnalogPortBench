"""The full prompt-v2 task set, built from the spec files on disk (so it cannot drift from them).

Task id: <tier>__<circuit>__<spec name>. Tiers:
  T1   port at VDD 1.8 V, circuits/<c>/spec.yaml (derived from the 180 nm source)
  T2   port at VDD 1.2 V, circuits/<c>/spec_1v2.yaml if it exists (voltage-range limits scaled), else spec.yaml;
       ota_tele has no 1.2 V port golden of spec.yaml and uses its three profiles p0/p1/p2 instead
  T3   hard spec points at 1.2 V, circuits/<c>/profiles/hard_*.yaml
  T4   proven infeasible at 1.2 V, circuits/<c>/profiles/infeasible_*.yaml (right answer: INFEASIBLE + best effort)
  T4f  frontier at 1.2 V, circuits/<c>/profiles/frontier_*.yaml (beyond the best known design, not proven impossible)
"""
import sys
from pathlib import Path

import yaml

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import config  # noqa: E402

CIRCUITS_V2 = ["cm_simple", "cm_cascode", "cascode_bias", "ota_5t", "opamp_2stg", "ota_tele",
               "cascode_bias_ws", "opamp_2stg_ws", "ota_tele_ws", "ota_fc_ws"]


def all_tasks():
    tasks = {}
    for c in CIRCUITS_V2:
        d = config.BENCH / "circuits" / c
        tasks[f"T1__{c}__spec"] = ("T1", c, d / "spec.yaml", 1.8)
        if c == "ota_tele":
            for p in sorted((d / "profiles").glob("p[0-9]_*.yaml")):
                tasks[f"T2__{c}__{p.stem}"] = ("T2", c, p, 1.2)
        else:
            s = d / "spec_1v2.yaml"
            tasks[f"T2__{c}__{s.stem if s.exists() else 'spec'}"] = ("T2", c, s if s.exists() else d / "spec.yaml", 1.2)
        for tier, pat in (("T3", "hard_*.yaml"), ("T4", "infeasible_*.yaml"), ("T4f", "frontier_*.yaml")):
            for p in sorted((d / "profiles").glob(pat)):
                tasks[f"{tier}__{c}__{p.stem}"] = (tier, c, p, yaml.safe_load(p.read_text()).get("vdd", 1.2))
    return tasks


if __name__ == "__main__":
    t = all_tasks()
    from collections import Counter
    print(len(t), "tasks:", dict(Counter(v[0] for v in t.values())))
