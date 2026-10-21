.subckt dut iref inp inn out
* bias: reference current into drain of diode-connected cascode stack
XB3 iref iref vb4x 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XB1 vb4x vb4x 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* vb3 = iref node, vb4 = vb4x
* first stage tail (cascoded)
XN3 net12 vb4x 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
XN0 net10 iref net12 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
* input pair (inn -> mirror diode side, inp -> output side)
XN2 net9 inn net10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XN1 net08 inp net10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS mirror load
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.35 nf=1 m=2
XP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.35 nf=1 m=2
* second stage
XP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.35 nf=1 m=10
XN4 net1 vb4x 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=5
XN5 out iref net1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=5
* Miller compensation
RR0 net08 net012 3k
CC0 net012 out 500f
.ends dut
