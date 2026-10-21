.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and elevated NMOS cascode bias.
RNB iin vb4 9k
RNG iin vb3 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1

* Cascoded reference mirror generates the PMOS biases.
XNBIAS nbias vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XNCBIAS vb2 vb3 nbias 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1
RPB vb1 vb2 9k

* NMOS cascode current sink.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1

* PMOS cascode current source.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1

.ends dut
