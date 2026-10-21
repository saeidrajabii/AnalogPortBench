.subckt CM_basic in out
XMN1 in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=4 nf=1 m=4
XMN0 out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=4 nf=1 m=4
.ends CM_basic
.subckt dut in out
XI0 in out CM_basic
.ends dut
