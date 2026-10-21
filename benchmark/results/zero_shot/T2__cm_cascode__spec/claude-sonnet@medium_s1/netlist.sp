.subckt dut in out
XMN3 in  in   net1 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMN2 out in   net2 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMN1 net1 net1 0   0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMN0 net2 net1 0   0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
.ends dut
