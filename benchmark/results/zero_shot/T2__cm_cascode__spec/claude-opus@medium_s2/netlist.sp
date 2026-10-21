.subckt dut in out
* Low-voltage self-biased cascode NMOS current mirror (SKY130, VDD=1.2V)
R1  in a 14k
* input branch
XMN3 a  in net1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=2
XMN1 net1 a 0   0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=2
* output branch
XMN2 out in net2 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=2
XMN0 net2 a 0    0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=2
.ends dut
