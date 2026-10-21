.subckt dut iref inp inn out
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XMBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1

XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1

XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XM2 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1
XP2 n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1

XM3 out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XP3 out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=1

RZ n1 nz 4k
CC nz out 1p
.ends dut
