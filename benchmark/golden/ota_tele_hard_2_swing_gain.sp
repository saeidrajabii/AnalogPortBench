* ota_tele, hard spec point H2 (near rail-to-rail swing with high gain): circuits/ota_tele/profiles/hard_2_swing_gain.yaml
* Topology: two stages. Stage 1 = NMOS input pair without NMOS cascodes (so o1 can sit at ~VGS) loaded by a PMOS
*   low-voltage cascode mirror (self-biased reference). Stage 2 = wide weak-inversion NMOS common source with an
*   AC-coupled class-AB PMOS load (Rb to the PMOS bias for DC, Cb from o1 for the signal); Miller Rz + Cc.
* Why: swing is decided by the output stage only, so it has no cascode and weak-inversion devices (Vdsat ~0.05-0.08 V);
*   gain comes from the long-channel input pair over a cascode load. Gain kept near 70 dB on purpose: the swing
*   testbench steps the input by 5 uV, so a much higher gain makes the measured swing coarser.
*   Revision (Oct 7): the class-A PMOS load starved while slewing up (14.5 % overshoot); class AB removes that.
*   Tail/bias mirrors at L = 1 (Vdsat 0.07 -> 0.06 V) keep the tail >= 53 mV at fs; input 88/1.75, M5 180/0.75 and
*   M6 at L = 1 set the gain; Rz = 2.4k, Cc = 1.66 pF set PM 63-65 deg.
* TT: gain 69.8 dB, UGF 18.6 MHz, PM 64.2 deg, GM 11.5 dB, 95.4 uW, settle 41.4/40.4 ns, swing 0.904 V
*   (0.12..1.02 V), overshoot 7.0 %.
* Corners: passes tt ff ss sf fs (27 C); worst-corner margin +3.4 % (UGF, ss), min saturation margin 53 mV,
*   max overshoot 8.2 %.
* Sized by hand (gm/Id, headroom budget, pole placement), one simulation per change; no automated search.
* Sky130 1.8 V LVT devices, VDD = 1.2 V, VCM = 0.6 V, Iref = 20 uA into iref, CL = 1 pF. NMOS bulks at 0.
.subckt dut iref inp inn out
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=4
XMBN2 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=1
XMBP vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 ad=5.8 as=5.8 pd=40.58 ps=40.58 m=1
XMBN3 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=1
XMBP2 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=64 L=1 nf=1 ad=18.56 as=18.56 pd=128.6 ps=128.6 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=4
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=88 L=1.75 nf=1 ad=25.52 as=25.52 pd=176.6 ps=176.6 m=1
XM2 o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=88 L=1.75 nf=1 ad=25.52 as=25.52 pd=176.6 ps=176.6 m=1
XMP3 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMP4 o1 vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMP1 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.75 nf=1 ad=3.48 as=3.48 pd=24.58 ps=24.58 m=1
XMP2 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.75 nf=1 ad=3.48 as=3.48 pd=24.58 ps=24.58 m=1
XM5 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=0.75 nf=1 ad=52.2 as=52.2 pd=360.6 ps=360.6 m=1
XM6 out g6 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 ad=17.4 as=17.4 pd=120.6 ps=120.6 m=6
Rp vpb vcp 60k
Rb vbp g6 2Meg
Cb o1 g6 1p
Rz o1 cz 2.4k
Cc cz out 1.66p
.ends dut
