.subckt CM_N_cascode_ws in out
* Self-biased wide-swing cascode current mirror
* in = cascode gate bias node (VA); nb = mirror gate node (VB = VA - Iref*R)
R1  in nb 12k
XMN3 nb in net1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN1 net1 nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN2 out in net2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN0 net2 nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends CM_N_cascode_ws

.subckt dut in out
XI0 in out CM_N_cascode_ws
.ends dut
