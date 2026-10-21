.subckt dut in out
XM3 in in n1 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=2 nf=1 m=1
XM2 out in n2 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=2 nf=1 m=1
XM1 n1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=2 nf=1 m=1
XM0 n2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=2 nf=1 m=1
.ends dut
