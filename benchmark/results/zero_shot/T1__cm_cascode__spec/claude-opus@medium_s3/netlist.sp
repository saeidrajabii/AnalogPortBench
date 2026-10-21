.subckt CM_N_cascode_lv in out
* Input branch: ideal Iref flows into "in", through R1 to node x, then the input cascode and the bottom device
R1   in  x     13k
XMN3 x    in  net1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN1 net1 x   0    0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* Output branch
XMN2 out  in  net2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN0 net2 x   0    0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends CM_N_cascode_lv

.subckt dut in out
XI0 in out CM_N_cascode_lv
.ends dut
