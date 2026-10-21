.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and wide-swing cascode bias.
RNB iin vb4 10k
RNG iin vb3 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1

* Mirrored reference branch generates the PMOS biases.
XNBIAS nbias vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1
XNCBIAS vb2 vb3 nbias 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=720 L=4 nf=1 m=1
RPB vb1 vb2 10k

* NMOS cascode current sink.
XNOUT nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1
XNCOUT out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1

* PMOS cascode current source.
XPOUT psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=720 L=4 nf=1 m=1
XPCOUT out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=720 L=4 nf=1 m=1

.ends dut
