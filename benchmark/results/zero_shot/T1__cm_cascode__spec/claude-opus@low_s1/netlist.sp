.subckt dut in out
* Wide-swing cascode current mirror (self-biased with R between in and a)
R1   in   a    12.5k
XMN3 a    in   n1   0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN1 n1   a    0    0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN2 out  in   n2   0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN0 n2   a    0    0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
