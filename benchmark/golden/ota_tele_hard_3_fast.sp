* ota_tele, hard spec point H3 (very fast): circuits/ota_tele/profiles/hard_3_fast.yaml
* Topology: single-stage NMOS-input TELESCOPIC cascode (same five-device stack as the 180 nm source) with a new
*   bias network: low-voltage NMOS cascode (Iref diode + Iref*Rc), self-biased PMOS low-voltage cascode mirror,
*   weak-inversion tail. No Miller capacitor: the output is the only high-impedance node.
* Why: one stage, NMOS input, no folding node is the fastest structure for CL = 1 pF; the original bias network
*   (stacked diodes) is what limited the telescopic to ~0.2 V swing at 1.2 V, not the stack itself.
* Limit found: the +/-0.1 V follower step moves the input common mode to 0.5 V, where VGS(input) + Vdsat(tail)
*   no longer fits; the tail leaves saturation and the falling edge settles slowly (fall 12.8 ns TT, 18.3 ns fs).
* TT: gain 49.0 dB, UGF 112 MHz, PM 65.2 deg, 145 uW, settle 6.0/12.8 ns, swing 0.505 V.
* Sized by hand (gm/Id, headroom budget, pole placement), one simulation per change; no automated search.
* Sky130 1.8 V LVT devices, VDD = 1.2 V, VCM = 0.6 V, Iref = 20 uA into iref, CL = 1 pF. NMOS bulks at 0.
* Passes its profile at tt, ff, ss, sf, fs (27 C).
.subckt dut iref inp inn out
XMB1 vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 ad=9.28 as=9.28 pd=64.58 ps=64.58 m=4
XMBN2 vcp vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 ad=9.28 as=9.28 pd=64.58 ps=64.58 m=1
XMBP vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 ad=3.48 as=3.48 pd=24.58 ps=24.58 m=1
XMT tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 ad=9.28 as=9.28 pd=64.58 ps=64.58 m=22
XM1 a1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=0.3 nf=1 ad=69.6 as=69.6 pd=480.58 ps=480.58 m=1
XM2 a2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=0.3 nf=1 ad=69.6 as=69.6 pd=480.58 ps=480.58 m=1
XMC1 d1 iref a1 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.3 nf=1 ad=17.4 as=17.4 pd=120.58 ps=120.58 m=1
XMC2 out iref a2 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.3 nf=1 ad=17.4 as=17.4 pd=120.58 ps=120.58 m=1
XMP3 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.5 nf=1 ad=34.8 as=34.8 pd=240.58 ps=240.58 m=1
XMP4 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.5 nf=1 ad=34.8 as=34.8 pd=240.58 ps=240.58 m=1
XMP1 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.5 nf=1 ad=13.05 as=13.05 pd=90.58 ps=90.58 m=1
XMP2 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=0.5 nf=1 ad=13.05 as=13.05 pd=90.58 ps=90.58 m=1
Rc iref vbn 18k
Rp vpb vcp 50k
.ends dut
