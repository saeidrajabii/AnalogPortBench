.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and resistor-shifted cascode bias.
RNB iin vb4 6k
RNG iin vb3 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=3 nf=1 m=1

* Mirrored reference current establishes the PMOS biases.
XNBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=3 nf=1 m=1
RPB vb1 vb2 6k
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=900 L=3 nf=1 m=1

* NMOS cascode current sink.
XNMAIN nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=3 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=3 nf=1 m=1

* PMOS cascode current source.
XPMAIN psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=900 L=3 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=900 L=3 nf=1 m=1

.ends dut
