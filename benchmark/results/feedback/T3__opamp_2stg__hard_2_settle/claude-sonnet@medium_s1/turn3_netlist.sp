.subckt dut iref inp inn out
* bias
XB3 iref iref vb4x 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XB1 vb4x vb4x 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* first stage tail
XN3 net10 vb4x 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
* input pair
XN2 net9 inn net10 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XN1 net08 inp net10 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* PMOS mirror load
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=2
XP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=2
* second stage
XP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=10
XN4 net1 vb4x 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=5
XN5 out iref net1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=5
* Miller compensation
RR0 net08 net012 3k
CC0 net012 out 400f
.ends dut
