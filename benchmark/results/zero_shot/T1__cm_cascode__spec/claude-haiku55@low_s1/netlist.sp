.subckt dut in out
* Cascode NMOS current mirror, SKY130 LVT, 1:1
* MN3: reference diode (top cascode)
XMN3 in in net1 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
* MN2: output cascode
XMN2 out in net2 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
* MN1: reference bottom (diode)
XMN1 net1 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
* MN0: output bottom mirror
XMN0 net2 net1 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
.ends dut
