* ota_tele, spec profile p0_as_source, VDD = 1.2 V (VCM = 0.6 V): circuits/ota_tele/profiles/p0_as_source.yaml
* Topology: two stages (same family as the H1 golden). Stage 1 = NMOS-input telescopic cascode with low-voltage
*   cascode bias (NMOS cascode gate = Iref diode + Iref*Rc; PMOS LV-cascode mirror, cascode gate = PMOS diode minus
*   5 uA*Rp). Stage 2 = NMOS common source with an AC-coupled class-AB PMOS load (Rb, Cb); Miller Rz + Cc.
* Why: the previous p0 golden (PMOS-input folded cascode + CS from an automated sizing search) failed sf/fs: the
*   PMOS-input tail and the self-biased cascode references lost saturation where PMOS Vth moves (+-0.14 V), and it
*   overshot 16 %. Re-biasing the telescopic stack (low-voltage cascodes) needs no folding branches; the p0 power
*   budget goes into a 42 uA tail (UGF 52 MHz, 13-17 ns settling) and a ~105 uA class-AB output (PM 66 deg).
*   Distinct from p1/p2 on purpose: fails p1 (216 uW > 160 uW) and p2 (UGF 52 < 60 MHz) at every corner.
* TT: gain 87.9 dB, UGF 51.8 MHz, PM 66.1 deg, GM 10.6 dB, 216 uW, settle 12.8/16.8 ns, swing 0.765 V,
*   overshoot 5.4 %.
* Corners: passes tt ff ss sf fs (27 C); worst-corner margin +3.0 % (gain margin, fs), min saturation margin
*   52 mV, max overshoot 7.1 %.
* Sized by hand (gm/Id, headroom budget, pole placement), one simulation per change; no automated search.
* Sky130 1.8 V LVT devices, VDD = 1.2 V, VCM = 0.6 V, Iref = 20 uA into iref, CL = 1 pF. NMOS bulks at 0.
.subckt dut iref inp inn out
XMB1 vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=8
XMBN2 vcp vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=2
XMBP vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 ad=5.8 as=5.8 pd=40.58 ps=40.58 m=1
XMBN3 vbp vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=2
XMBP2 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.75 nf=1 ad=2.32 as=2.32 pd=16.58 ps=16.58 m=1
XMT tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=20
XM1 a1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.5 nf=1 ad=46.4 as=46.4 pd=320.6 ps=320.6 m=1
XM2 a2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.5 nf=1 ad=46.4 as=46.4 pd=320.6 ps=320.6 m=1
XMC1 d1 iref a1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMC2 o1 iref a2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMP3 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=1 nf=1 ad=21.75 as=21.75 pd=150.6 ps=150.6 m=1
XMP4 o1 vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=1 nf=1 ad=21.75 as=21.75 pd=150.6 ps=150.6 m=1
XMP1 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=1
XMP2 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=1
XM5 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.35 nf=1 ad=17.4 as=17.4 pd=120.6 ps=120.6 m=1
XM6 out g6 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.75 nf=1 ad=2.32 as=2.32 pd=16.58 ps=16.58 m=20
Rc iref vbn 20k
Rp vpb vcp 84k
Rb vbp g6 2Meg
Cb o1 g6 1.2p
Rz o1 cz 750
Cc cz out 1.5p
.ends dut
