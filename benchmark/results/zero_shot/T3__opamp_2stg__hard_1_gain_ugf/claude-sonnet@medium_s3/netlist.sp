.subckt dut iref inp inn out
* bias: iref enters diode-connected drain of stacked mirror
RB iref vb3 1
XB3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XB4 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* tail current source (40uA)
XT net10 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=2
* input pair
XN1 net08 inp net10 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XN2 net9 inn net10 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
* PMOS mirror load
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* second stage
XP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=6
XN5 out vb3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=6
XN4 net1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=6
* compensation
RZ net08 net012 1.5k
CC net012 out 500f
.ends dut
