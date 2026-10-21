.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and level-shifted cascode bias.
RIN iin vb3 1
RNBIAS vb3 vb4 6k
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1

* Mirrored reference establishes the PMOS biases.
XNPREF vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1
RPBIAS vb1 vb2 6k
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=2 nf=1 m=1

* NMOS cascode current sink.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1
XNCASC out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1

* PMOS cascode current source.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=2 nf=1 m=1
XPCASC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=2 nf=1 m=1

.ends dut
