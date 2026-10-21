.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and wide-swing cascode bias.
* The reference current enters a resistor and diode-connected drain,
* never a transistor source.
RIN iin vb3 1
RNB vb3 vb4 5k
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=4 nf=1 m=1

* Two mirrored reference currents establish the PMOS biases.
XNBIAS1 vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=4 nf=1 m=1
XNBIAS2 vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=4 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=4 nf=1 m=2
RPB vb1 vb2 5k

* NMOS cascode current sink.
XNMAIN nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=4 nf=1 m=1
XNCASC out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=4 nf=1 m=1

* PMOS cascode current source.
XPMAIN psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=4 nf=1 m=1
XPCASC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=4 nf=1 m=1

.ends dut
