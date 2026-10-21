.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current establishes the NMOS mirror bias.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=10 nf=1 m=12
XNBIAS vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=10 nf=1 m=12

* The mirrored current establishes the PMOS mirror bias.
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=10 nf=1 m=24

XNOUT out vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=10 nf=1 m=12
XPOUT out vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=10 nf=1 m=24

RNB iin vb4 1
RNC vb4 vb3 1
RPB vb1 vb2 1
.ends dut
