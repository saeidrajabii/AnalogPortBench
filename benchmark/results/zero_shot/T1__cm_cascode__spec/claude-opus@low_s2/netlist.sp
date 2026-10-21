.subckt dut in out
R1  in x 12k
XM3 x  in n1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM1 n1 x  0  0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 out in n2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM0 n2 x  0  0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
