.subckt dut iref inp inn out
* bias
XMi   iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=8   L=0.8 nf=1 m=1
XMnp  vb2  iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=1.6 L=0.8 nf=1 m=1
XMpd  vb2  vb2  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1   L=1   nf=1 m=1
XMp2  vb3  vb2  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1   L=1   nf=1 m=1
XMb   vb3  vb3  nA  0   sky130_fd_pr__nfet_01v8_lvt W=1   L=1   nf=1 m=1
XMa2  nA   iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=1.6 L=0.8 nf=1 m=1
* ota
XMt   tail iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=8   L=0.8 nf=1 m=1
XM2   net010 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20  L=0.5 nf=1 m=1
XM1   net016 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20  L=0.5 nf=1 m=1
XP1   net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XP3   net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XP4   net1 vb2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP5   out  vb2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XN6   net1 vb3 n18 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XN9   out  vb3 n17 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XN7   n18  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XN8   n17  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
.ends dut
