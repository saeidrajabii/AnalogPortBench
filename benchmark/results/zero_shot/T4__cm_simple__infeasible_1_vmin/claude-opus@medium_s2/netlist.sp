.subckt dut in out
* Self-biased wide-swing cascode current mirror (SKY130, VDD=1.2V)
* Iref enters 'in' (cascode gate bias), R drops I*R to node nb
Rb in nb 10k
* reference branch
XMC1 nb in x1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM1  x1 nb 0  0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* output branch
XMC2 out in x2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2  x2 nb 0  0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
