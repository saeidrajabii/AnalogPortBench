.subckt CM_N_cascode in out
XN3 in in net1 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.4 nf=1 m=1
XN2 out in net2 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.4 nf=1 m=1
XN1 net1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.4 nf=1 m=1
XN0 net2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.4 nf=1 m=1
.ends CM_N_cascode
.subckt dut in out
XI0 in out CM_N_cascode
.ends dut
