.subckt dut in out
* input branch
XM3 in in x 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
R1 x d1 5k
XM1 d1 x 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* output branch
XM4 out in d2 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
XM2 d2 x 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
.ends dut
