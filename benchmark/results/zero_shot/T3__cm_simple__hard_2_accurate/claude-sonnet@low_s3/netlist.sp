.subckt dut in out
XM1 a a 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2 in in a 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XM0 b a 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM3 out in b 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
.ends dut
