.subckt dut iref inp inn out
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
XN2 net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XN1 out  inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP0 out  net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
