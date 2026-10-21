.subckt dut iin out vb1 vb2 vb3 vb4

RNB iin vb4 3k
RNG iin vb3 1

XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=200

XNBIAS nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=200
XNCBIAS vb2 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=800

XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=2 nf=1 m=800
RPB vb1 vb2 3k

XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=200
XNCSINK out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=800

XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=2 nf=1 m=800
XPCSOURCE out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=2 nf=1 m=3200

.ends dut
