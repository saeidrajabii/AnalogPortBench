.subckt dut in out
R1 in g 10k
XM4 g g 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XM0 net2 g 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XM2 out in net2 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
.ends dut
