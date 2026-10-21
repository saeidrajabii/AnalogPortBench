.subckt dut iin out vb1 vb2 vb3 vb4

* Reference-current sensing and low-headroom NMOS cascode bias.
RNB iin vb4 4k
RNG iin vb3 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1

* Two nominally 20-uA mirrored branches establish the PMOS biases.
* The PMOS reference device carries their combined current.
XNBIAS1 nb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
XNCAS1 vb1 vb3 nb1 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1

XNBIAS2 nb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
XNCAS2 vb2 vb3 nb2 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1

XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300000 L=100 nf=1 m=2
RPB vb1 vb2 4k

* NMOS cascode output current sink.
XNOUT0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
XNOUT1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1

* PMOS cascode output current source.
XPOUT0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300000 L=100 nf=1 m=1
XPOUT1 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=300000 L=100 nf=1 m=1

.ends dut
