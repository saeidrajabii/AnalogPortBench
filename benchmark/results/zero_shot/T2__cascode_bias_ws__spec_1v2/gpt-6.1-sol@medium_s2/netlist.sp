.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and level-shifted cascode bias.
RIN iin vb3 1
RBN vb3 vb4 8.2k
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=10 nf=1 m=100

* Mirrored reference drives the PMOS bias generator.
XNFEED vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=10 nf=1 m=100
RBP vb1 vb2 8.2k
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=10 nf=1 m=100

* NMOS cascode current sink.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=10 nf=1 m=100
XNCASC out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=10 nf=1 m=100

* PMOS cascode current source.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=10 nf=1 m=100
XPCASC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=10 nf=1 m=100

.ends dut
