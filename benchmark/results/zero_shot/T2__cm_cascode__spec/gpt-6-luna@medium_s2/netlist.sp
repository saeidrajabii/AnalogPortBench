.subckt dut in out
XM3 in   in   net1 net1 sky130_fd_pr__nfet_01v8_lvt W=40 L=5 nf=1 m=10
XM2 out  in   net2 0    sky130_fd_pr__nfet_01v8_lvt W=40 L=5 nf=1 m=10
XM1 net1 net1 0    0    sky130_fd_pr__nfet_01v8_lvt W=40 L=5 nf=1 m=10
XM0 net2 net1 0    0    sky130_fd_pr__nfet_01v8_lvt W=40 L=5 nf=1 m=10
.ends dut
