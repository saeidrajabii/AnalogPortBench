* ota_tele, hard spec point H5 (all p0_as_source limits at reduced power): circuits/ota_tele/profiles/hard_5_allround_power.yaml
* Topology: two stages. Stage 1 = NMOS-input telescopic cascode with low-voltage cascode bias (as H1, re-sized:
*   ~30 uA tail, short mirror). Stage 2 = NMOS common source with an AC-coupled class-AB PMOS load (Rb to the
*   PMOS bias, Cb from o1); Miller Rz + Cc.
* Why: a folded first stage pays for the folding branches; the telescopic first stage reuses its current, and
*   class AB gives the output stage twice the gm and push-pull slewing for ~55 uA, so the p0 UGF/settling limits
*   are met at 139 uW. Revision (Oct 7): tail/bias mirrors L = 2 -> 0.5 (Vdsat 0.07 -> 0.05 V, tail >= 58 mV at
*   fs), Rc 15k -> 18k to keep the cascode node where it was, Rp 75k -> 62k to move ~40 mV of headroom from MP1
*   to MP3 (MP3 had 36 mV at fs).
* TT: gain 79.2 dB, UGF 48.6 MHz, PM 67.2 deg, GM 11.3 dB, 138.6 uW, settle 16.1/17.5 ns, swing 0.804 V,
*   overshoot 5.2 %.
* Corners: passes tt ff ss sf fs (27 C); worst-corner margin +1.1 % (power, ff), min saturation margin 58 mV,
*   max overshoot 6.1 %.
* Sized by hand (gm/Id, headroom budget, pole placement), one simulation per change; no automated search.
* Sky130 1.8 V LVT devices, VDD = 1.2 V, VCM = 0.6 V, Iref = 20 uA into iref, CL = 1 pF. NMOS bulks at 0.
.subckt dut iref inp inn out
XMB1 vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=4
XMBN2 vcp vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=1
XMBP vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 ad=5.8 as=5.8 pd=40.58 ps=40.58 m=1
XMBN3 vbp vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=1
XMBP2 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 ad=1.45 as=1.45 pd=10.58 ps=10.58 m=1
XMT tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=7
XM1 a1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.5 nf=1 ad=46.4 as=46.4 pd=320.58 ps=320.58 m=1
XM2 a2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.5 nf=1 ad=46.4 as=46.4 pd=320.58 ps=320.58 m=1
XMC1 d1 iref a1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMC2 o1 iref a2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMP3 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMP4 o1 vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMP1 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 ad=3.48 as=3.48 pd=24.58 ps=24.58 m=1
XMP2 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 ad=3.48 as=3.48 pd=24.58 ps=24.58 m=1
XM5 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=42 L=0.35 nf=1 ad=12.18 as=12.18 pd=84.58 ps=84.58 m=1
XM6 out g6 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 ad=1.45 as=1.45 pd=10.58 ps=10.58 m=10
Rc iref vbn 18k
Rp vpb vcp 62k
Rb vbp g6 2Meg
Cb o1 g6 1.5p
Rz o1 cz 1.6k
Cc cz out 1.15p
.ends dut
