.subckt CM_N_cascode in out
XMN3 in in net1 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.5 nf=1 m=4
XMN2 out in net2 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.5 nf=1 m=4
XMN1 net1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.5 nf=1 m=4
XMN0 net2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.5 nf=1 m=4
.ends CM_N_cascode
.subckt dut in out
XI0 in out CM_N_cascode
.ends dut
