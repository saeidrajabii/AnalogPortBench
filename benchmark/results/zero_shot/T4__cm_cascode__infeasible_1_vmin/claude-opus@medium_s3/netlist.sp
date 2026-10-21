.subckt dut in out
* reference branch: Iref -> in -> R1 -> x -> MC1 -> n1 -> M1 -> gnd
R1  in x 8k
XMC1 x  in n1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM1  n1 x  0  0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* output branch: out -> MC0 -> n2 -> M0 -> gnd
XMC0 out in n2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM0  n2  x  0  0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
.ends dut
