.subckt dut in out
* reference branch
XM3 in  vb  a   0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM1 a   g1  0   0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* output branch
XM4 out vb  b   0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM2 b   g1  0   0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* bias for mirror gates
R1 vdd g1 35k
XM5 g1 g1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* bias for cascode gates
R2 vdd vb 27k
XM6 vb vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=1 nf=1 m=1
.ends dut
