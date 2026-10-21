.subckt dut in out
* input branch (replica)
XM1i di1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2i in gi di1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMai gi di1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
Rli vdd gi 2Meg
* output branch
XM1o do1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2o out go do1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMao go do1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
Rlo vdd go 2Meg
.ends dut
