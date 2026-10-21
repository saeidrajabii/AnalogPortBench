.subckt dut in out
* Reference branch: in is diode-connected cascode (MN3) over diode-connected bottom device (MN1)
XMN3 in in net1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMN1 net1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
* Output branch: cascode (MN2) gate biased from a resistive tap of 'in' (k ~ 0.78)
XMN2 out g2 net2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMN0 net2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
* Cascode gate bias divider (draws ~0.1 uA from 'in')
R1 in g2 2.2Meg
R2 g2 0 8Meg
.ends dut
