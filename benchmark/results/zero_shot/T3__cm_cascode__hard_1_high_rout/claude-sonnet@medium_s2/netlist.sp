.subckt dut in out
* bottom mirror devices
XM1 n1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2 n2 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* cascodes
XM3 in b n1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM4 out b n2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* cascode bias (W/L = 1/4 of M3)
XM5 b b 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
RB vdd b 40k
.ends dut
