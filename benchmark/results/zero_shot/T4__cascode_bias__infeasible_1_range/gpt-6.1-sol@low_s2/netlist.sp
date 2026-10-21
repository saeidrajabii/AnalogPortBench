.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference: the input current enters a drain, not a source.
* The resistor raises the NMOS cascode bias above the mirror bias.
RNB iin vb4 4k
RNC iin vb3 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=10 nf=1 m=1

* Mirrored reference branch generates both PMOS gate biases.
XNB vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=10 nf=1 m=1
RPB vb1 vb2 4k
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60000 L=10 nf=1 m=1

* NMOS cascode current sink.
XNS nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=10 nf=1 m=1
XNC out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=10 nf=1 m=1

* PMOS cascode current source.
XPS psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60000 L=10 nf=1 m=1
XPC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=60000 L=10 nf=1 m=1

.ends dut
