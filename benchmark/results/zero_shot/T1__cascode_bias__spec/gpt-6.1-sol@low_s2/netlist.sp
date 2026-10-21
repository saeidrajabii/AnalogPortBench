.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and wide-swing cascode bias.
RIN iin vb3 1
RBN vb3 vb4 9k
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1

* Mirrored reference branch generates the PMOS biases.
XNBIAS nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1
XNCBIAS vb2 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=600 L=4 nf=1 m=1
RBP vb1 vb2 9k

* NMOS cascode current sink.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1
XNCSINK out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1

* PMOS cascode current source.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=600 L=4 nf=1 m=1
XPCSOURCE out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=600 L=4 nf=1 m=1

.ends dut
