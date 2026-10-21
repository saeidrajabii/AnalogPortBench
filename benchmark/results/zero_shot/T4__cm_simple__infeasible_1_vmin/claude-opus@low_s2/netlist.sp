.subckt dut in out
* reference branch: in -> R1 -> b ; cascode MN3 (gate=in) ; bottom MN1 (gate=b)
R1 in b 7.5k
XMN3 b in a 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=4
XMN1 a b 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=4
* output branch
XMN4 out in x 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=4
XMN2 x b 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=4
.ends dut
