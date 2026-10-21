.subckt dut iref inp inn out
* bias: iref into diode stack, mirrored to vb3 / vb4
RB iref vb3 1
XB1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.3 nf=1 m=1
XB3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.3 nf=1 m=1
* tail (cascoded)
XN3 n12 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.3 nf=1 m=2
XN0 n10 vb3 n12 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.3 nf=1 m=2
* input pair: inp -> output side, inn -> mirror diode side
XN1 n08 inp n10 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.3 nf=1 m=3
XN2 n9 inn n10 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.3 nf=1 m=3
* PMOS mirror load
XP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP0 n08 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* second stage
XP2 out n08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XN4 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.3 nf=1 m=4
XN5 out vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.3 nf=1 m=4
* Miller compensation
RC n08 n012 2k
CC n012 out 500f
.ends dut
