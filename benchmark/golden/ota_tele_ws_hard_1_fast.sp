* ota_tele_ws, hard spec point hard_1_fast, VDD = 1.2 V (VCM = 0.6 V), Sky130 1.8 V LVT devices
* Verified with: python benchmark/evaluate.py ota_tele_ws benchmark/golden/ota_tele_ws_hard_1_fast.sp
*                --spec benchmark/circuits/ota_tele_ws/profiles/hard_1_fast.yaml [--corner tt|ff|ss|sf|fs]
* Design: SINGLE-stage PMOS-input folded cascode (input bulk = tail), NMOS fold sinks + NMOS cascodes, PMOS
* low-voltage cascode mirror load; the output is the only high-impedance node, so no Miller capacitor and
* UGB = gm1/CL ~ 110 MHz with ~70 deg PM. 108 uA tail (gm1 ~ 0.9 mS), fold sinks 97 uA so the sinks never
* starve during the 0.2 V step (no slew-recovery overshoot). Same bias as the 1.2 V golden (self-biased NMOS
* cascode reference, PMOS diode references). Gain (~50 dB) and swing (~0.42 V) are what it gives up.
* Input pair polarity: out is on the inn side (one inversion through the fold), unlike the two-stage designs.
.subckt dut iref inp inn out
R0 iref vnc 1
Rn vnc vnb 11k
XMBN2 vnb vnc bn1 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMBN1 bn1 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.25 L=1 nf=1 m=1
XMBS1 vpb vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.125 L=1 nf=1 m=1
XMBP1 vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XMBS3 vpc vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.125 L=1 nf=1 m=1
XMBD vpc vpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6.5 L=2 nf=1 m=1
XMT tail vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.7 nf=1 m=6
XM1 f1 inp tail tail sky130_fd_pr__pfet_01v8_lvt W=190 L=0.35 nf=1 m=1
XM2 f2 inn tail tail sky130_fd_pr__pfet_01v8_lvt W=190 L=0.35 nf=1 m=1
XMS1 f1 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMS2 f2 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMC1 d1 vnc f1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMC2 out vnc f2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP3 d1 vpc p1 vdd sky130_fd_pr__pfet_01v8_lvt W=130 L=0.7 nf=1 m=1
XMP1 p1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.7 nf=1 m=1
XMP4 out vpc p2 vdd sky130_fd_pr__pfet_01v8_lvt W=130 L=0.7 nf=1 m=1
XMP2 p2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.7 nf=1 m=1
.ends dut
