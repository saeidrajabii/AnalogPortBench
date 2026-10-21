.subckt dut iin out vb1 vb2 vb3 vb4
* The input current establishes the NMOS mirror bias.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=4 nf=1 m=1
RNB1 iin vb3 1
RNB2 vb3 vb4 1

* An NMOS mirror branch establishes the PMOS mirror bias.
XNBIAS vb1 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=4 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10000 L=4 nf=1 m=1
RPB vb1 vb2 1

* Output current source and sink.
XPOUT out vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10000 L=4 nf=1 m=1
XNOUT out vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=4 nf=1 m=1
.ends dut
