.subckt dut iref inp inn out
* bias: reference diode stack (20uA)
XB1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XB3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
RB iref vb3 1
* tail (60uA)
XT net10 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
* input pair
XN2 net9 inn net10 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1
XN1 net08 inp net10 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1
* mirror load
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.2 nf=1 m=1
XP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.2 nf=1 m=1
* second stage (120uA)
XP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=107 L=0.8 nf=1 m=1
XN4 net1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XN5 out vb3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
* compensation
RZ net08 net012 700
CC net012 out 600f
.ends dut
