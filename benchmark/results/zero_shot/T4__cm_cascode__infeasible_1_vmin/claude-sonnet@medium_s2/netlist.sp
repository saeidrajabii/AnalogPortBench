.subckt CM_N_cascode in out
XMN3 in  in  net1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN2 out in  net2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN1 net1 net1 0  0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN0 net2 net1 0  0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends CM_N_cascode

.subckt dut in out
XI0 in out CM_N_cascode
.ends dut
