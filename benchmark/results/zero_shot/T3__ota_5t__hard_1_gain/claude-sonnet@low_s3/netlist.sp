.subckt dut iref inp inn out
XB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=2 nf=1 m=2
XT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=2 nf=1 m=3
XN2 net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
XN1 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
XP0 out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
.ends dut
