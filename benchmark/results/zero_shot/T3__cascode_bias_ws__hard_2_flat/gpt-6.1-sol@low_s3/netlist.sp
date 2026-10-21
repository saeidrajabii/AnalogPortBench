.subckt dut iin out vb1 vb2 vb3 vb4

* Reference NMOS and resistive cascode-bias offset.
* The reference current enters the drain, not the source.
RBN iin vb4 5.5k
RBG vb3 iin 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1

* Cascoded reference-current mirror feeding the PMOS bias branch.
XNBIAS_LO nbias vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1
XNBIAS_HI vb2 vb3 nbias 0 sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1

* PMOS reference and resistive cascode-bias offset.
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=600000 L=1000 nf=1 m=1
RBP vb1 vb2 5.5k

* NMOS cascode current sink.
XNOUT_LO nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1
XNOUT_HI out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=200000 L=1000 nf=1 m=1

* PMOS cascode current source.
XPOUT_HI psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=600000 L=1000 nf=1 m=1
XPOUT_LO out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=600000 L=1000 nf=1 m=1

.ends dut
