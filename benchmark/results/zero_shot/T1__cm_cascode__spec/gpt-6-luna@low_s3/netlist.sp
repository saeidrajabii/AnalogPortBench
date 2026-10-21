.subckt CM_N_cascode in out
XM3 in   in   net1 net1 sky130_fd_pr__nfet_01v8_lvt W=40 L=2.5 nf=1 m=1
XM2 out  in   net2 net2 sky130_fd_pr__nfet_01v8_lvt W=40 L=2.5 nf=1 m=1
XM1 net1 net1 0    0    sky130_fd_pr__nfet_01v8_lvt W=40 L=2.5 nf=1 m=1
XM0 net2 net1 0    0    sky130_fd_pr__nfet_01v8_lvt W=40 L=2.5 nf=1 m=1
.ends CM_N_cascode

.subckt dut in out
XI0 in out CM_N_cascode
.ends dut
