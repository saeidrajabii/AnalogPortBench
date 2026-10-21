.subckt CM_N_cascode in out
* reference branch: in -> R1 -> cascode MN3 -> MN1
R1 in nx 12k
XMN3 nx in net1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN1 net1 nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* output branch
XMN2 out in net2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN0 net2 nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends CM_N_cascode

.subckt dut in out
XI0 in out CM_N_cascode
.ends dut
