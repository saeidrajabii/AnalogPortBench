* ota_fc_ws, hard spec point hard_1_speed, VDD = 1.2 V (VCM = 0.6 V)
* Verified with benchmark/evaluate.py --spec circuits/ota_fc_ws/profiles/hard_1_speed.yaml: >= 5 % margin on every
* limit at TT, passes at tt ff ss sf fs.
* Design: single-stage folded cascode, the advisor's topology turned around for 1.2 V: NMOS input pair on a single
* weak-inversion tail, PMOS current sources (vbp) and PMOS cascodes (vbpc, bulk tied to source to cut the fold-node
* capacitance), and the self-biased low-voltage cascode MIRROR moved to the NMOS side (gate of MN1/MN2 = cascode drain
* n1). One high-impedance node (the output, loaded by CL) = no Miller capacitor, so the unity-gain frequency and the
* settling are about twice the two-stage design's; gain (~39 dB) and swing (~0.43 V) are what it gives up.
* Fold branches carry 85 uA (casc current 58 uA) against 27 uA per input so the PMOS cascode pole stays ~3x above UGB;
* short PMOS cascodes (L = 0.35) for speed. Bias: Iref diode MB, PMOS diode MPB (vbp), PMOS strong-inversion diode MPBC
* (vbpc), long NMOS diode MBC (vbnc).
.subckt dut iref inp inn out
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=1 nf=1 ad=46.4 as=46.4 pd=320.6 ps=320.6 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=480 L=1 nf=1 ad=139.2 as=139.2 pd=960.6 ps=960.6 m=1
XMBP vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 ad=23.2 as=23.2 pd=160.6 ps=160.6 m=1
XMPB vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=0.75 nf=1 ad=2.175 as=2.175 pd=15.58 ps=15.58 m=1
XMBN2 vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 ad=23.2 as=23.2 pd=160.6 ps=160.6 m=1
XMPBC vbpc vbpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.3 L=1 nf=1 ad=0.667 as=0.667 pd=5.18 ps=5.18 m=1
XMPC vbnc vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=0.75 nf=1 ad=2.175 as=2.175 pd=15.58 ps=15.58 m=1
XMBC vbnc vbnc 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 ad=0.58 as=0.58 pd=4.58 ps=4.58 m=1
XM1 f1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=135 L=1 nf=1 ad=39.15 as=39.15 pd=270.6 ps=270.6 m=1
XM2 f2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=135 L=1 nf=1 ad=39.15 as=39.15 pd=270.6 ps=270.6 m=1
XMP1 f1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=67.5 L=0.75 nf=1 ad=19.57 as=19.57 pd=135.6 ps=135.6 m=1
XMP2 f2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=67.5 L=0.75 nf=1 ad=19.57 as=19.57 pd=135.6 ps=135.6 m=1
XMC1 n1 vbpc f1 f1 sky130_fd_pr__pfet_01v8_lvt W=21 L=0.35 nf=1 ad=6.09 as=6.09 pd=42.58 ps=42.58 m=1
XMC2 out vbpc f2 f2 sky130_fd_pr__pfet_01v8_lvt W=21 L=0.35 nf=1 ad=6.09 as=6.09 pd=42.58 ps=42.58 m=1
XMN3 n1 vbnc s1 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 ad=8.7 as=8.7 pd=60.58 ps=60.58 m=1
XMN4 out vbnc s2 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 ad=8.7 as=8.7 pd=60.58 ps=60.58 m=1
XMN1 s1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 ad=17.4 as=17.4 pd=120.6 ps=120.6 m=1
XMN2 s2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 ad=17.4 as=17.4 pd=120.6 ps=120.6 m=1
.ends dut
