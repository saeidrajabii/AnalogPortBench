.subckt dut iref inp inn out
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 d2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM5 out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=0.5 nf=1 m=1
RZ d2 cz 500
CC cz out 0.8p
.ends dut
