.subckt CM_N_lvcascode in out
* R1 sets the cascode gate (in) I*R above the bottom-device gate (nb)
R1  in nb 12.5k
* Reference branch
XMN3 nb   in net1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN1 net1 nb 0    0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1   nf=1 m=1
* Output branch
XMN2 out  in net2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN0 net2 nb 0    0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1   nf=1 m=1
.ends CM_N_lvcascode

.subckt dut in out
XI0 in out CM_N_lvcascode
.ends dut
