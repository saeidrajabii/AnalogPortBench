.subckt dut iref inp inn out
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM3 x2 x2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
XM4 x1 x2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
XM6 out x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=6
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=1 nf=1 m=1
Rz x1 cz 6k
Cc cz out 0.5p
.ends dut
