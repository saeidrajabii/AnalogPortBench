.subckt dut in out
XMRT in in net1 net1 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=20
XMRB net1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=20
XMOT out in net2 net2 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=20
XMOB net2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=20
.ends dut
