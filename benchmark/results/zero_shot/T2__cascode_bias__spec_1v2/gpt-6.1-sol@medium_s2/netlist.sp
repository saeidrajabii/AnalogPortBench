.subckt Cascode_Bias iin vb1 vb2 vb3 vb4
* Reference mirror and low-headroom NMOS cascode bias.
RNB iin vb4 7.5k
RNG iin vb3 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=40

* Mirrored reference branch generates the PMOS biases.
XNBIAS nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=40
XNCBIAS vb2 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=40
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=4 nf=1 m=120
RPB vb1 vb2 7.5k
.ends Cascode_Bias

.subckt dut iin out vb1 vb2 vb3 vb4
XBIAS iin vb1 vb2 vb3 vb4 Cascode_Bias

* NMOS cascode current sink.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=40
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=40

* PMOS cascode current source.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=4 nf=1 m=120
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=4 nf=1 m=120
.ends dut
