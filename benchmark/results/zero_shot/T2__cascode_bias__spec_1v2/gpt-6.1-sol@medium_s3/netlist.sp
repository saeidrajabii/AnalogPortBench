.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and level-shifted cascode bias.
RIN iin vb3 1
RNBIAS vb3 vb4 8k
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=10

* Mirrored reference current establishes the PMOS biases.
XNBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=10
RPBIAS vb1 vb2 8k
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=4 nf=1 m=10

* Wide-swing NMOS cascode current sink.
XNLOW nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=10
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=10

* Wide-swing PMOS cascode current source.
XPHIGH psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=4 nf=1 m=10
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=4 nf=1 m=10

.ends dut
