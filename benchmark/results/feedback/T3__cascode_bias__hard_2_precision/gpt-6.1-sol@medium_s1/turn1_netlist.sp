.subckt dut iin out vb1 vb2 vb3 vb4

* Reference NMOS diode and resistive cascode-gate level shift.
RNB iin vb4 3k
RNG iin vb3 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=100 nf=1 m=1

* Mirrored reference branch establishes the PMOS biases.
XNBIAS nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=100 nf=1 m=1
XNCBIAS vb2 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=80000 L=100 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80000 L=100 nf=1 m=1
RPB vb1 vb2 3k

* NMOS cascode current sink.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20000 L=100 nf=1 m=1
XNCSINK out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=80000 L=100 nf=1 m=1

* PMOS cascode current source.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80000 L=100 nf=1 m=1
XPCSOURCE out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=320000 L=100 nf=1 m=1

.ends dut
