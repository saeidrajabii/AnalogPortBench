.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and level-shifted cascode bias.
RNB iin vb4 9k
RNG iin vb3 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=3 nf=1 m=1

* Mirrored reference branch generates the PMOS biases.
XNB nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=3 nf=1 m=1
XNC vb2 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=3 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=3 nf=1 m=1
RPB vb1 vb2 9k

* NMOS cascode current sink.
XNS nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=3 nf=1 m=1
XNCOUT out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=3 nf=1 m=1

* PMOS cascode current source.
XPS psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=3 nf=1 m=1
XPCOUT out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=3 nf=1 m=1

.ends dut
