# Golden reference designs

Hand designs of the five benchmark circuits in Sky130 1.8 V LVT, at VDD = 1.8 V and 1.2 V, with
full simulator access and many iterations. They are **references, not benchmark
runs**: they show what a passing port looks like and, at 1.2 V, that a redesign can meet the spec where
resizing the original topology cannot. Verify with `python benchmark/golden/verify_golden.py` (10/10 pass).

| Circuit | 1.8 V design | 1.2 V design |
|---|---|---|
| cm_simple | original 1:1 mirror, W/L = 40/4 µm | same |
| cm_cascode | self-biased low-voltage cascode mirror (R = 15 kΩ), all bulks to ground | same |
| cascode_bias | wide-swing cascode bias on both sides (matched range 1.43 V) | NMOS low-voltage cascode sink + single long-channel PMOS source (range 0.96 V, at the physical limit) |
| ota_5t | PMOS-input 5T OTA (suits VCM = 0.5 V), long-channel input and load | same |
| opamp_2stg | telescopic first stage + PMOS low-voltage cascode load, Cc = 950 fF, Rz = 2.85 kΩ | same topology, re-tuned (hand start, refined by a local sizing search over this topology) |

Test conditions are unchanged at 1.2 V (VCM, Iref, load). Key margins are small for the opamp at both supplies
and for the cascode bias at 1.2 V: the specs, derived at 1.8 V, sit close to what Sky130 can reach.
