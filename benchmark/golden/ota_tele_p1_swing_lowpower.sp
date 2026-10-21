* ota_tele, spec profile p1_swing_lowpower, VDD = 1.2 V (VCM = 0.6 V): circuits/ota_tele/profiles/p1_swing_lowpower.yaml
* Topology: two-stage Miller OTA (same family as the H2 golden). Stage 1 = NMOS input pair (22 uA tail) over a PMOS
*   low-voltage cascode mirror; stage 2 = wide weak-inversion NMOS common source with an AC-coupled class-AB PMOS
*   load (Rb, Cb); Miller Rz + Cc.
* Why: the previous p1 golden (simple two-stage with a PMOS input pair, from an automated sizing search) failed
*   ss/sf: at the slow-PMOS corners its tail went into triode (-73 mV) and the UGF halved. An NMOS input pair keeps
*   the tail saturated at VCM = 0.6 V, the uncascoded weak-inversion output stage swings 0.90 V, and class AB keeps
*   the overshoot low at 132 uW. Distinct from p0/p2: fails both (UGF 22 MHz < 44.6 / 60 MHz) at every corner.
* TT: gain 69.9 dB, UGF 22.4 MHz, PM 67.3 deg, GM 11.6 dB, 132 uW, settle 31.1/35.2 ns, swing 0.897 V
*   (0.13..1.02 V), overshoot 4.3 %.
* Corners: passes tt ff ss sf fs (27 C); worst-corner margin +8.4 % (UGF, ss), min saturation margin 55 mV,
*   max overshoot 5.4 %.
* Sized by hand (gm/Id, headroom budget, pole placement), one simulation per change; no automated search.
* Sky130 1.8 V LVT devices, VDD = 1.2 V, VCM = 0.6 V, Iref = 20 uA into iref, CL = 1 pF. NMOS bulks at 0.
.subckt dut iref inp inn out
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=4
XMBN2 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=1
XMBP vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 ad=5.8 as=5.8 pd=40.58 ps=40.58 m=1
XMBN3 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=1
XMBP2 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=64 L=1 nf=1 ad=18.56 as=18.56 pd=128.6 ps=128.6 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=5
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=88 L=1.75 nf=1 ad=25.52 as=25.52 pd=176.6 ps=176.6 m=1
XM2 o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=88 L=1.75 nf=1 ad=25.52 as=25.52 pd=176.6 ps=176.6 m=1
XMP3 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMP4 o1 vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMP1 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.75 nf=1 ad=3.48 as=3.48 pd=24.58 ps=24.58 m=1
XMP2 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.75 nf=1 ad=3.48 as=3.48 pd=24.58 ps=24.58 m=1
XM5 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=0.75 nf=1 ad=52.2 as=52.2 pd=360.6 ps=360.6 m=1
XM6 out g6 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 ad=17.4 as=17.4 pd=120.6 ps=120.6 m=11
Rp vpb vcp 60k
Rb vbp g6 2Meg
Cb o1 g6 1p
Rz o1 cz 1.8k
Cc cz out 1.6p
.ends dut
