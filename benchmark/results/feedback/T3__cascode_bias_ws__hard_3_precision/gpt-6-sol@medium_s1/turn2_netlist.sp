.subckt dut iin out vb1 vb2 vb3 vb4
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=20
XNBIAS vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=20
XNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=20

XPBIAS vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=20
XPOUT out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=20

RVB2 vb1 vb2 1
RVB3 iin vb3 1
RVB4 iin vb4 1
.ends dut
