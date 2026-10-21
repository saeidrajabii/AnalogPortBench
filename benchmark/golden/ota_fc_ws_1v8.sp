* ota_fc_ws, VDD = 1.8 V
* Verified with benchmark/evaluate.py (TT, 27 C, same testbenches and spec.yaml as every other design); passes at tt ff ss sf fs.
* Design: the advisor's topology unchanged (wide-swing cascode bias + NMOS-input folded cascode with a self-biased
* PMOS cascode mirror on top and NMOS cascode sinks, cascoded tail); only W/L/m are new. Bias branches run at 10 uA,
* input pair 20 uA each (tail 2 x 20 uA), fold branches 15 uA, PMOS sources 2 x 17.5 uA per side.
* Why these sizes: in this topology the output sits at the PMOS mirror node (VDD - Vsg_top), and the headroom left for
* the top PMOS source plus its cascode is only Vsg_top - Vdsat_top - Vdsat_casc (~0.37 V at TT, ~0.2 V at fs, where the
* Sky130 PMOS |Vth| drops by ~0.13 V). The top PMOS run in strong inversion (J ~ 2.5 uA/sq, L = 1) to widen that budget,
* vb2 (MP4) gives the top PMOS ~0.1 V of saturation margin and the cascode the rest; L = 1 PMOS (L = 0.36 PMOS have
* gm/gds < 15 in Sky130). Small input pair (W = 40) keeps the tail-node pole high: the open-loop test drives one input only.
* NMOS sinks/cascodes in weak inversion (W = 40 per 10 uA) for output swing.
.subckt dut iref inp inn out
* --- wide-swing cascode bias (advisor's Cascode_Bias_WS), branches at 10 uA
XMN4 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 ad=5.8 as=5.8 pd=40.58 ps=40.58 m=2
XMN6 b1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 ad=5.8 as=5.8 pd=40.58 ps=40.58 m=1
XMN7 b2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 ad=5.8 as=5.8 pd=40.58 ps=40.58 m=1
XMN12 vb2 vb2 b1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 ad=5.8 as=5.8 pd=40.58 ps=40.58 m=1
XMN11 vb1 vb1 b2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 ad=5.8 as=5.8 pd=40.58 ps=40.58 m=1
XMP4 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.3 L=2 nf=1 ad=0.667 as=0.667 pd=5.18 ps=5.18 m=1
XMP3 b13 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 m=1
XMP2 vb1 vb2 b13 vdd sky130_fd_pr__pfet_01v8_lvt W=26.5 L=1 nf=1 ad=7.685 as=7.685 pd=53.58 ps=53.58 m=1
XMP7 b5 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 m=1
XMP6 vb3 vb2 b5 vdd sky130_fd_pr__pfet_01v8_lvt W=26.5 L=1 nf=1 ad=7.685 as=7.685 pd=53.58 ps=53.58 m=1
XMN8 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 m=1
XMP11 b6 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 ad=1.16 as=1.16 pd=8.58 ps=8.58 m=1
XMP10 vb4 vb2 b6 vdd sky130_fd_pr__pfet_01v8_lvt W=26.5 L=1 nf=1 ad=7.685 as=7.685 pd=53.58 ps=53.58 m=1
XMN9 vb4 vb3 b10 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XMN10 b10 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
* --- folded-cascode OTA (advisor's OTA_Folded_Cascode)
XOMN2 f1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XOMN1 f2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XOMN0 tail vb3 t1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=2
XOMN3 t1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=2
XOMN5 tail vb3 t2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=2
XOMN4 t2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=2
XOMP0 f1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=1 nf=1 ad=2.03 as=2.03 pd=14.58 ps=14.58 m=1
XOMP1 f1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=1 nf=1 ad=2.03 as=2.03 pd=14.58 ps=14.58 m=1
XOMP2 f2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=1 nf=1 ad=2.03 as=2.03 pd=14.58 ps=14.58 m=1
XOMP3 f2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=1 nf=1 ad=2.03 as=2.03 pd=14.58 ps=14.58 m=1
XOMP4 n1 vb2 f1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XOMP5 out vb2 f2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 ad=11.6 as=11.6 pd=80.58 ps=80.58 m=1
XOMN6 n1 vb3 s1 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 ad=17.4 as=17.4 pd=120.6 ps=120.6 m=1
XOMN7 s1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 ad=17.4 as=17.4 pd=120.6 ps=120.6 m=1
XOMN9 out vb3 s2 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 ad=17.4 as=17.4 pd=120.6 ps=120.6 m=1
XOMN8 s2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 ad=17.4 as=17.4 pd=120.6 ps=120.6 m=1
.ends dut
