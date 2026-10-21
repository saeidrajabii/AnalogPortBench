.subckt CM_N_cascode_ws in out
* resistor-biased wide-swing cascode current mirror
R1  in nd 12k
XMN3 nd   in net1 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMN1 net1 nd 0    0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMN2 out  in net2 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMN0 net2 nd 0    0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
.ends CM_N_cascode_ws

.subckt dut in out
XI0 in out CM_N_cascode_ws
.ends dut
