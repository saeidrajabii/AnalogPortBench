.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current establishes the NMOS mirror bias.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=8 nf=1 m=1
XNPBIAS pbias iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=8 nf=1 m=1

* The mirrored reference current establishes the PMOS mirror bias.
XPPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=8 nf=1 m=1

* Matched source and sink meet at out.
XPSRC out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=8 nf=1 m=1
XNSINK out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=8 nf=1 m=1

* Unloaded bias-voltage outputs.
RVB1 vb1 pbias 1
RVB2 vb2 pbias 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
