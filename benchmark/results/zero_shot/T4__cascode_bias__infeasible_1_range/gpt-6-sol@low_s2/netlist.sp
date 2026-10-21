.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current enters a diode-connected NMOS and is mirrored
* into the PMOS bias branch; it does not flow into a transistor source.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=200
XNBias pbias iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=200
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=2 nf=1 m=400

XNSINK out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=200
XPSOURCE out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=2 nf=1 m=400

RVB1 pbias vb1 1
RVB2 pbias vb2 1
RVB3 iin vb3 1
RVB4 iin vb4 1
.ends dut
