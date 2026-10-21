* cascode_bias_ws, hard spec point hard_2_flat (profiles/hard_2_flat.yaml), VDD = 1.2 V
* Topology: the advisor's wide-swing bias unchanged (as cascode_bias_ws_1v2.sp). Mismatch at Vo = 0.9 V comes from
* the output conductance between the replica drain (vb4 ~0.42 V) and 0.9 V, so the output and replica cascodes are
* long at large W/L (Vdsat small, range kept): NMOS cascodes MN2/MN9 L = 4 um (W/L 200), NMOS bottoms MN0/MN10
* L = 4 um (W/L 100), PMOS cascodes MP0/MP2/MP6/MP10 L = 4 um (W/L 800), PMOS mirrors L = 8 um (W/L 200).
* Rev 2: MN6 was only 5 mV in saturation at sf/ss (Vds = vb2 - VGS12, vb2 drops with slow PMOS): MN12 W/L 200 -> 1600
* and MN11 200 -> 800 (smaller level-shift VGS) give MN6 >= 64 mV. Iref mirror MN4/6/7 L 8 -> 4 at W/L 50 (-7,200 um^2;
* errors improve slightly as MN7's Vds rises). Gate area 122,192 -> 116,992 um^2. Further cuts were tried and rejected:
* halving the PMOS cascode W/L raises VSG(MP2) 30 mV, squeezing Vsd(MP1) to 50 mV margin and mismatch to -49 nA (fail);
* shorter PMOS mirrors cost range (limit 0.95 V needs 1.00 V at TT for 5 % margin).
* TT: mismatch -32.5 nA (limit 36), range 0.09-1.09 V = 1.00 V (limit 0.95), Isink -1.8 %, Isource -1.9 % (limit 5),
* no triode. Corners: pass at tt ff ss sf fs, |mismatch| <= 34.7 nA (ff), range >= 0.99 V, min sat margin 64 mV (MN6, sf).
.subckt dut iin out vb1 vb2 vb3 vb4
XMN4 iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=2
XMN6 net1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=2
XMN7 net2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=2
XMN12 vb2 vb2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=16
XMN11 vb1 vb1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=8
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
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=8
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=16
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=4 nf=1 m=32
.ends dut
