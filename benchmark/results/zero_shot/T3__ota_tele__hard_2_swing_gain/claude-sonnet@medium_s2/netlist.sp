.subckt dut iref inp inn out
* bias mirror
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
* input pair
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2 o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* PMOS mirror load
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XM4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* second stage
XM6 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=56 L=0.7 nf=1 m=1
* Miller compensation with nulling resistor
RZ o1 z 3k
CC z out 1.2p
.ends dut
