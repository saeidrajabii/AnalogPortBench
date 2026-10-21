.subckt CM_N_cascode_lv in out
* resistor sets the cascode gate one I*R step above the lower mirror gate
R1 in nb 10k
XMN3 nb in net1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN2 out in net2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN1 net1 nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN0 net2 nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends CM_N_cascode_lv
.subckt dut in out
XI0 in out CM_N_cascode_lv
.ends dut
