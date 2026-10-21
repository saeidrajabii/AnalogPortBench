.subckt dut iref inp inn out
XB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XT0 tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XN2 net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1 nf=1 m=1
XN1 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1 nf=1 m=1
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XP0 out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
