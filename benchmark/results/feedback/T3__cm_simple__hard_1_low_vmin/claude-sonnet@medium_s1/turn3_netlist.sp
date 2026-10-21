.subckt dut in out
XMC3 in in g 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=10
XM1 g g 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=25
XM0 s g 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=27
XMC0 out in s 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
