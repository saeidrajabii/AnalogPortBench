.subckt dut in out
XMN1 net1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=2 nf=1 m=1
XMN2 in in net1 net1 sky130_fd_pr__nfet_01v8_lvt W=400 L=2 nf=1 m=1
XMN3 net2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=2 nf=1 m=1
XMN4 out in net2 net2 sky130_fd_pr__nfet_01v8_lvt W=400 L=2 nf=1 m=1
.ends dut
