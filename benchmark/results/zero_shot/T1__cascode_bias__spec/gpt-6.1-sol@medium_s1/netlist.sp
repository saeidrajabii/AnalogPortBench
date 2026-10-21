.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and level-shifted cascode bias.
RIN iin vb3 1
RNBIAS vb3 vb4 12k
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1

* Cascoded reference-current mirror generating PMOS biases.
XNBIAS nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1
XNCBIAS vb2 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1
RPBIAS vb1 vb2 12k
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=720 L=4 nf=1 m=1

* NMOS cascode current sink.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=4 nf=1 m=1

* PMOS cascode current source.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=720 L=4 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=720 L=4 nf=1 m=1

.ends dut
