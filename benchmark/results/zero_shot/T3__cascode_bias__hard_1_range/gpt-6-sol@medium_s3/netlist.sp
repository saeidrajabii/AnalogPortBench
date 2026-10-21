.subckt dut iin out vb1 vb2 vb3 vb4
* The input current establishes the NMOS mirror bias.
XNREF iin vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=30 nf=1 m=75
RND iin vb4 1m

* An NMOS mirror leg establishes the PMOS mirror bias.
XNBIAS vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=30 nf=1 m=75
XPBIAS vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=30 nf=1 m=225

* Output source and sink.
RNB vb3 vb4 1m
RPB vb2 vb1 1m
XNOUT out vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=30 nf=1 m=75
XPOUT out vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=30 nf=1 m=225
.ends dut
