.subckt dut in out
* Diode-connected reference stack and matched cascode output stack.
XM3 in   in   net1 net1 sky130_fd_pr__nfet_01v8_lvt W=30 L=10 nf=1 m=1
XM1 net1 net1 0    0    sky130_fd_pr__nfet_01v8_lvt W=30 L=10 nf=1 m=1
XM2 out  in   net2 net2 sky130_fd_pr__nfet_01v8_lvt W=30 L=10 nf=1 m=1
XM0 net2 net1 0    0    sky130_fd_pr__nfet_01v8_lvt W=30 L=10 nf=1 m=1
.ends dut
