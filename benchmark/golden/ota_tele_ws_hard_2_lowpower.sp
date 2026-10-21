* ota_tele_ws, hard spec point hard_2_lowpower, VDD = 1.2 V (VCM = 0.6 V), Sky130 1.8 V LVT devices
* Verified with: python benchmark/evaluate.py ota_tele_ws benchmark/golden/ota_tele_ws_hard_2_lowpower.sp
*                --spec benchmark/circuits/ota_tele_ws/profiles/hard_2_lowpower.yaml [--corner tt|ff|ss|sf|fs]
* Design: same two-stage architecture as ota_tele_ws_1v2.sp (folded cascode + PMOS common source, replica-
* biased output sink, Miller Rz + Cc) scaled to ~88 uA total, of which Iref is 20 uA: PMOS bias branches 4.6
* and 2 uA, tail 12 uA, fold sinks 13.6 uA (> tail, so no slew-recovery overshoot), output stage 30 uA.
* Weak-inversion input (W=120, L=0.35) keeps gm1/Id high; the output unit is split (W=2.5 units) so the replica
* MR is one identical unit. Cc = 0.8 pF and 30 uA in M6 keep the output slew above the stage-1 slew.
.subckt dut iref inp inn out
R0 iref vnc 1
Rn vnc vnb 12k
XMBN2 vnb vnc bn1 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMBN1 bn1 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.25 L=1 nf=1 m=1
XMBS1 vpb vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5625 L=1 nf=1 m=1
XMBP1 vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMBS3 vpc vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.78 L=1 nf=1 m=1
XMBD vpc vpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.3 L=2 nf=1 m=1
XMT tail vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=1 nf=1 m=1
XM1 f1 inn tail tail sky130_fd_pr__pfet_01v8_lvt W=120 L=0.35 nf=1 m=1
XM2 f2 inp tail tail sky130_fd_pr__pfet_01v8_lvt W=120 L=0.35 nf=1 m=1
XMS1 f1 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.4 L=1 nf=1 m=1
XMS2 f2 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.4 L=1 nf=1 m=1
XMC1 d1 vnc f1 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XMC2 o1 vnc f2 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XMP3 d1 vpc p1 vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.7 nf=1 m=1
XMP1 p1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.7 nf=1 m=1
XMP4 o1 vpc p2 vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.7 nf=1 m=1
XMP2 p2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.7 nf=1 m=1
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.5 L=0.7 nf=1 m=8
XM6 out vnr 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.9 L=1 nf=1 m=8
XMR vnr d1f vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.5 L=0.7 nf=1 m=1
XMNR vnr vnr 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.9 L=1 nf=1 m=1
Rf d1 d1f 2meg
Cf d1f vdd 0.5p
Rz o1 cz 7k
Cc cz out 0.8p
.ends dut
