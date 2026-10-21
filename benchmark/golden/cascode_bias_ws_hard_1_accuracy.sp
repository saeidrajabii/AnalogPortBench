* cascode_bias_ws, hard spec point hard_1_accuracy (profiles/hard_1_accuracy.yaml), VDD = 1.2 V
* Topology change vs the advisor's design: the simple Iref mirror (MN4 diode, MN11/MN12 diode level shifters) is
* replaced by a self-biased low-voltage cascode mirror: R4 (8.5 kOhm) between iin and the bottom-gate node g4,
* new cascode MN5 in the reference, and MN11/MN12 become cascodes gated by iin. MN4/MN6/MN7 then all sit at
* Vds ~0.155 V at every corner (the 1v2 golden has 0.45 V vs 0.15/0.24 V, a -2 to -4 % DIBL error in weak
* inversion). Rest of the wide-swing bias and output stage as in cascode_bias_ws_1v2.sp (rev 1: L = 8 PMOS mirrors).
* Rev 2: Iref mirror MN4/6/7 L 8 -> 4 at W/L 50 (Vds matched by the cascode mirror, so no accuracy change; -7,200 um^2);
* sink bottoms MN0/MN10 L 2 -> 4 at W/L 50 (+2,400 um^2): less DIBL from the 5 mV Vds difference between output and
* replica, Isink +0.44 -> +0.39 % and mismatch -94 -> -82 nA, worst-corner margin 1.6 % -> 5.4 % (now set by the range at fs). Gate area
* 75,592 -> 70,792 um^2. Shorter PMOS mirrors (the remaining 51,200 um^2) push mismatch past 100 nA, so they stay.
* TT: Isink +0.39 %, Isource -0.02 % (limit 0.55 %), mismatch -82 nA (limit 100), range 0.99 V (limit 0.93), no triode.
* Corners: pass at tt ff ss sf fs, |mismatch| <= 86 nA, |Isink| <= 0.46 % (fs), min sat margin 65 mV (MN10).
.subckt dut iin out vb1 vb2 vb3 vb4
R4 iin g4 8.5k
XMN5 g4 iin d4 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=2
XMN4 d4 g4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=2
XMN6 net1 g4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=2
XMN7 net2 g4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=2
XMN12 vb2 iin net1 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=2
XMN11 vb1 iin net2 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=2
XMP4 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP3 net13 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=16
XMP2 vb1 vb2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=16
XMP7 net5 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=16
XMP6 vb3 vb2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=16
XMN8 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
XMP11 net6 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=16
XMP10 vb4 vb2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=16
XMN9 vb4 vb3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=2
XMN10 net10 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=4
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=4
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=16
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=16
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=2
.ends dut
