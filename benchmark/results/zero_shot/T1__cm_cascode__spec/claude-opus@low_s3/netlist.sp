.subckt CM_N_lv_cascode in out
  R1  in x 10k
  XMN3 x   in net1 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
  XMN1 net1 x 0    0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
  XMN2 out in net2 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
  XMN0 net2 x 0    0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
.ends CM_N_lv_cascode

.subckt dut in out
XI0 in out CM_N_lv_cascode
.ends dut
