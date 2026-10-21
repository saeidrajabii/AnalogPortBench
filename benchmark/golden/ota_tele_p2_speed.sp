* ota_tele, spec profile p2_speed, VDD = 1.2 V (VCM = 0.6 V): circuits/ota_tele/profiles/p2_speed.yaml
* Topology: single-stage folded cascode with complementary input pairs, no Miller capacitor. The NMOS pair folds into
*   PMOS low-voltage cascodes under PMOS current sources (top); the PMOS pair (own n-well, bulk = source) folds into
*   the NMOS cascode mirror (bottom, cascoded diode at d1). Bias: Iref diode, NMOS cascode gate = Iref node, PMOS
*   references from NMOS mirrors (PMOS cascode gate = PMOS diode minus 5 uA*Rp).
* Why: the 0.2 V follower step moves the input common mode between 0.5 and 0.7 V. At 0.5 V an NMOS pair's tail
*   leaves saturation at the slow-NMOS corners (VCM - VGS ~0.03 V), at 0.7 V a PMOS pair's tail does at the slow-PMOS
*   corners, so every single-polarity version (the old PMOS folded cascode, an NMOS telescopic tried here) missed the
*   12 ns settling on one edge at some corner. With both pairs one is always fully on. The top sources (~78 uA) carry
*   more than both pair currents together (~63 uA) so no cascode cuts off while slewing; top sources at L = 1 and
*   longer cascodes give the gain. Distinct from p0/p1: fails p0 (gain 50 < 66.8 dB) and p1 (249 uW > 160 uW,
*   swing 0.47 < 0.75 V) at every corner.
* TT: gain 50.0 dB, UGF 63.2 MHz, PM 66.5 deg, GM 14.5 dB, 249 uW, settle 11.0/9.8 ns, swing 0.469 V (0.28..0.75 V),
*   overshoot 3.7 %.
* Corners: passes tt ff ss sf fs (27 C); worst-corner margin +0.9 % (UGF, ss), min saturation margin 63 mV,
*   max overshoot 5.6 %.
* Sized by hand (gm/Id, headroom budget, pole placement), one simulation per change; no automated search.
* Sky130 1.8 V LVT devices, VDD = 1.2 V, VCM = 0.6 V, Iref = 20 uA into iref, CL = 1 pF. NMOS bulks at 0; PMOS input pair bulks at their source.
.subckt dut iref inp inn out
* bias: Iref diode, NMOS cascode gate = Iref node (Iref*Rc above the diode), PMOS references
XMB1 vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=4
Rc iref vbn 12k
XMBN2 vpc vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=1
XMBP vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 ad=3.48 as=3.48 pd=24.58 ps=24.58 m=1
Rp vpb vpc 58k
XMBN3 vpt vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=1
XMBPT vpt vpt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
* complementary input pairs
XMTN tn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=10
XMN1 f1 inp tn 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=0.5 nf=1 ad=58 as=58 pd=400.6 ps=400.6 m=1
XMN2 f2 inn tn 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=0.5 nf=1 ad=58 as=58 pd=400.6 ps=400.6 m=1
XMTP tp vpt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=4
XQP1 g1 inp tp tp sky130_fd_pr__pfet_01v8_lvt W=200 L=0.5 nf=1 ad=58 as=58 pd=400.6 ps=400.6 m=1
XQP2 g2 inn tp tp sky130_fd_pr__pfet_01v8_lvt W=200 L=0.5 nf=1 ad=58 as=58 pd=400.6 ps=400.6 m=1
* folded cascode summing stage
XMS1 f1 vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 ad=6.96 as=6.96 pd=48.58 ps=48.58 m=9
XMS2 f2 vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 ad=6.96 as=6.96 pd=48.58 ps=48.58 m=9
XPC1 d1 vpc f1 vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=0.7 nf=1 ad=26.1 as=26.1 pd=180.6 ps=180.6 m=1
XPC2 out vpc f2 vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=0.7 nf=1 ad=26.1 as=26.1 pd=180.6 ps=180.6 m=1
XNC1 d1 iref g1 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=0.5 nf=1 ad=43.5 as=43.5 pd=300.6 ps=300.6 m=1
XNC2 out iref g2 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=0.5 nf=1 ad=43.5 as=43.5 pd=300.6 ps=300.6 m=1
XNS1 g1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.75 nf=1 ad=14.5 as=14.5 pd=100.6 ps=100.6 m=1
XNS2 g2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.75 nf=1 ad=14.5 as=14.5 pd=100.6 ps=100.6 m=1
.ends dut
