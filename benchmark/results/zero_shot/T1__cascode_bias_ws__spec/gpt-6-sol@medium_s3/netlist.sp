.subckt dut iin out vb1 vb2 vb3 vb4
* Reference current enters the drain of a diode-connected NMOS.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=3 nf=1 m=1

* Mirror the reference current into a diode-connected PMOS to form vb1.
XNPBIAS vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=3 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=3 nf=1 m=1

* Wide-swing cascode biases; divider currents are small relative to 20 uA.
RNV vb4 iin 1
RNHI vdd vb3 82Meg
RNLO vb3 vb4 18Meg
RPHI vb1 vb2 18Meg
RPLO vb2 0 82Meg

* Output NMOS cascode current sink.
XNS nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=3 nf=1 m=1
XNC out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=3 nf=1 m=1

* Output PMOS cascode current source.
XPS psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=3 nf=1 m=1
XPC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=3 nf=1 m=1
.ends dut
