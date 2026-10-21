.subckt dut iref inp inn out
* Bias: iref diode XB1 (20 uA); XB6/XB8 mirror 10 uA
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XB3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.6 L=0.5 nf=1 m=1
XB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Tail: 40 uA (2 x mirror of XB1)
XT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=2
* Input pair: long L for higher output resistance, wide for gm and tail headroom
X1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.0 nf=1 m=1
X2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.0 nf=1 m=1
* NMOS cascodes
X3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.0 nf=1 m=1
X4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.0 nf=1 m=1
* PMOS folding cascodes and sources
X5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1.0 nf=1 m=1
X6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1.0 nf=1 m=1
X7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1.0 nf=1 m=1
X8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1.0 nf=1 m=1
.ends dut
