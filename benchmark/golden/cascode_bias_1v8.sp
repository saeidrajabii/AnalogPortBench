* cascode_bias, VDD = 1.8 V
* Verified with benchmark/evaluate.py (TT, 27 C, same testbench and spec as every other design).
* Design (topology change): wide-swing (low-voltage) cascode bias on both sides. Self-biased NMOS and PMOS
* references (R1, R2) keep the bottom devices at ~0.3 V instead of a full Vgs, so the matched output range
* grows to ~1.4 V (spec 0.96 V, 180 nm original 1.2 V).
.subckt dut iin out vb1 vb2 vb3 vb4
R0 iin vb3 1
R1 vb3 vb4 15k
XN3 vb4 vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XN1 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XN5 vb2 vb3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XN4 n2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
R2 vb1 vb2 15k
XP3 vb1 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1
XP1 p1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XP1O psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XP0O out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1
.ends dut
