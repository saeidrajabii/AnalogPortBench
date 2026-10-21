* ota_tele, hard spec point H1 (very high gain with speed): circuits/ota_tele/profiles/hard_1_gain_speed.yaml
* Topology: two stages. Stage 1 = NMOS-input TELESCOPIC cascode (the source's core stack) with low-voltage cascode
*   bias: NMOS cascode gate = Iref diode + Iref*Rc, PMOS LV-cascode mirror whose cascode gate is a PMOS diode
*   minus 5 uA*Rp (tracks the PMOS Vth). Stage 2 = NMOS common source with an AC-coupled class-AB PMOS load
*   (Rb to the PMOS bias sets the DC current, Cb from o1 carries the signal); Miller Rz + Cc.
* Why: >= 83 dB needs two gain stages with a cascoded first stage; an NMOS input pair keeps the tail usable at
*   VCM = 0.6 V. Revision (Oct 7): the class-A output stage starved while slewing up (it must deliver
*   Itail*(1 + CL/Cc), ~70 of its 87 uA), which gave 14-19 % overshoot; class AB pushes harder as o1 falls and
*   saves ~20 uW. Tail/bias mirrors at L = 0.5 and a 160 um input pair give the tail >= 54 mV at the slow-NMOS
*   corners; Rc = 20k keeps M1/M2 saturated at sf; a small PMOS mirror (12/0.5) and M5 at L = 0.35 keep the mirror
*   and o1 poles clear of the 47 MHz crossover; Rp is centred so MP1 and MP3 both keep >= 54 mV.
* TT: gain 88.2 dB, UGF 46.8 MHz, PM 65.1 deg, GM 11.0 dB, 183 uW, settle 15.0/17.5 ns, swing 0.788 V
*   (0.19..0.98 V), overshoot 5.9 %.
* Corners: passes tt ff ss sf fs (27 C); worst-corner margin +1.9 % (power, ff), min saturation margin 54 mV,
*   max overshoot 7.7 %.
* Sized by hand (gm/Id, headroom budget, pole placement), one simulation per change; no automated search.
* Sky130 1.8 V LVT devices, VDD = 1.2 V, VCM = 0.6 V, Iref = 20 uA into iref, CL = 1 pF. NMOS bulks at 0.
.subckt dut iref inp inn out
XMB1 vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=8
XMBN2 vcp vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=2
XMBP vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 ad=5.8 as=5.8 pd=40.58 ps=40.58 m=1
XMBN3 vbp vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=2
XMBP2 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.75 nf=1 ad=2.32 as=2.32 pd=16.58 ps=16.58 m=1
XMT tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=17
XM1 a1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.5 nf=1 ad=46.4 as=46.4 pd=320.6 ps=320.6 m=1
XM2 a2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.5 nf=1 ad=46.4 as=46.4 pd=320.6 ps=320.6 m=1
XMC1 d1 iref a1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMC2 o1 iref a2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMP3 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 ad=17.4 as=17.4 pd=120.6 ps=120.6 m=1
XMP4 o1 vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 ad=17.4 as=17.4 pd=120.6 ps=120.6 m=1
XMP1 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 ad=3.48 as=3.48 pd=24.58 ps=24.58 m=1
XMP2 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 ad=3.48 as=3.48 pd=24.58 ps=24.58 m=1
XM5 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.35 nf=1 ad=17.4 as=17.4 pd=120.6 ps=120.6 m=1
XM6 out g6 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.75 nf=1 ad=2.32 as=2.32 pd=16.58 ps=16.58 m=16
Rc iref vbn 20k
Rp vpb vcp 88k
Rb vbp g6 2Meg
Cb o1 g6 1.2p
Rz o1 cz 850
Cc cz out 1.42p
.ends dut
