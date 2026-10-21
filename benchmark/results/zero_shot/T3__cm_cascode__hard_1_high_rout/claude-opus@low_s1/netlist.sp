.subckt dut in out
* Reference branch: in -> MN3 (cascode) -> net1 -> MN1, with MN1's gate tied to in
MN1 net1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
MN3 in vc net1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN1 net1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMN3 in vc net1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
