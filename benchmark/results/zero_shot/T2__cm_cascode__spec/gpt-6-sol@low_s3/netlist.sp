.subckt dut in out
XM1 net1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=600 L=6 nf=1 m=1
XM2 in in net1 0 sky130_fd_pr__nfet_01v8_lvt W=600 L=6 nf=1 m=1
XM3 net2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=600 L=6 nf=1 m=1
XM4 out in net2 0 sky130_fd_pr__nfet_01v8_lvt W=600 L=6 nf=1 m=1
.ends dut
