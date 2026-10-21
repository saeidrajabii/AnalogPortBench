* cascode_bias_ws, hard spec point hard_3_precision (profiles/hard_3_precision.yaml), VDD = 1.2 V
* Combines both fixes: the self-biased low-voltage cascode Iref mirror of hard_1_accuracy (topology change: R4,
* MN5, MN11/MN12 as cascodes gated by iin) and the long output/replica cascodes of hard_2_flat.
* Rev 2: Iref mirror MN4/6/7 L 8 -> 4 at W/L 50 (Vds matched by the cascode mirror, results unchanged), gate area
* 122,392 -> 115,192 um^2. Saturation margin already >= 78 mV at every corner. The long PMOS mirrors/cascodes
* (102,400 um^2) set the 36 nA mismatch and 0.99 V range and cannot be cut without failing those limits (see hard_2).
* TT: Isink +0.18 %, Isource +0.02 % (limit 0.25 %), mismatch -33 nA (limit 36), range 0.99 V (limit 0.94), no triode.
* Corners: pass at tt ff ss sf fs, |mismatch| <= 34.8 nA (ff), |Isink| <= 0.24 % (fs), min sat margin 78 mV (MP1, fs).
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
XMP2 vb1 vb2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=4 nf=1 m=32
XMP7 net5 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=16
XMP6 vb3 vb2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=4 nf=1 m=32
XMN8 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
XMP11 net6 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=16
XMP10 vb4 vb2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=4 nf=1 m=32
XMN9 vb4 vb3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=8
XMN10 net10 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=4
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=4
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=16
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=4 nf=1 m=32
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=8
.ends dut
