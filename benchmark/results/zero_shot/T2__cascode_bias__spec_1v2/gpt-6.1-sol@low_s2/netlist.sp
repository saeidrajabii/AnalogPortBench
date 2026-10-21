.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and raised NMOS cascode bias.
RNB iin vb4 5k
RNG iin vb3 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1

* Mirror the reference current into the PMOS bias branch.
XNBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1
RPB vb1 vb2 5k

* Low-overdrive NMOS cascode current sink.
XNMAIN nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XNCASC out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1

* Low-overdrive PMOS cascode current source.
XPMAIN psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1
XPCASC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1

.ends dut
