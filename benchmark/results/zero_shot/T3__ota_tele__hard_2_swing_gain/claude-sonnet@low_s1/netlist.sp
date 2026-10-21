.subckt dut iref inp inn out
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.8 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.8 nf=1 m=1
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.4 nf=1 m=1
XM2 o1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.4 nf=1 m=1
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XM4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=2
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.8 nf=1 m=2
Rz o1 cz 2k
Cc cz out 1.5p
.ends dut
