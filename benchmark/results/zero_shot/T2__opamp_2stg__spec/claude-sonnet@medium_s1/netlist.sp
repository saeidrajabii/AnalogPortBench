.subckt dut iref inp inn out
* bias: reference diode stack (20uA)
XB1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XB3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
RB iref vb3 1
* tail (70uA)
XT net10 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=17.5 L=0.5 nf=1 m=1
* input pair
XN2 net9 inn net10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XN1 net08 inp net10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* mirror load
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=1
* second stage
XP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=4
XN4 net1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XN5 out vb3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.5 nf=1 m=1
* compensation
RZ net08 net012 1.2k
CC net012 out 500f
.ends dut
