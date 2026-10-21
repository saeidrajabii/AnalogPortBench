.subckt dut in out
R1 in x 10k
XMN3 x in net1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN1 net1 x 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN2 out in net2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN0 net2 x 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
