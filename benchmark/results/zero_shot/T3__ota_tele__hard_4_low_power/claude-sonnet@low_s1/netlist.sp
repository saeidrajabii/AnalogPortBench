.subckt dut iref inp inn out
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.6 L=1 nf=1 m=1
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM2 o1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XM4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.4 L=1 nf=1 m=1
RZ o1 cz 4k
CC cz out 1p
.ends dut
