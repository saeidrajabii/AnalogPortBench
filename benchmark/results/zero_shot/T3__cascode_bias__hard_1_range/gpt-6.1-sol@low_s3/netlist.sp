.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and low-headroom cascode bias.
RIN iin vb3 1
RBN vb3 vb4 4k
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1

* Mirrored reference branch generates the PMOS biases.
XNRB nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1
XNRC vb2 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=800000 L=1000 nf=1 m=1
RBP vb1 vb2 4k

* NMOS cascode current sink.
XNOUTB nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1
XNOUTC out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1

* PMOS cascode current source.
XPOUTB psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=800000 L=1000 nf=1 m=1
XPOUTC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=800000 L=1000 nf=1 m=1

.ends dut
