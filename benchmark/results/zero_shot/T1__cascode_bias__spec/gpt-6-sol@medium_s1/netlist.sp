.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current develops the NMOS mirror bias and a raised cascode bias.
RNB iin vb4 9k
RNG iin vb3 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=1

* A mirrored reference current develops the PMOS biases.
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=4 nf=1 m=1
RPB vb1 vb2 9k
XNPB vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=1

* Cascoded output sink and source.
XNB nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=1
XNC out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=1
XPT psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=4 nf=1 m=1
XPC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=4 nf=1 m=1
.ends dut
