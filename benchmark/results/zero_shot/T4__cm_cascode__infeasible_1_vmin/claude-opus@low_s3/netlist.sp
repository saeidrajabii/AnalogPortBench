.subckt dut in out
* Reference branch: in -> cascode MN3 gate; R drops ~150 mV to set the low-voltage bias
R1  in   nd   7.5k
XMN3 nd  in  net1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XMN1 net1 nd 0    0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
* Output branch
XMN2 out in  net2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XMN0 net2 nd 0    0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
.ends dut
