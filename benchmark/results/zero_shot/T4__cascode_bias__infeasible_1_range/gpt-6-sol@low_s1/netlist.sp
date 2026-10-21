.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current enters a diode-connected NMOS. A matched NMOS
* mirrors it to the diode-connected PMOS that establishes the source bias.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=4 nf=1 m=1
XNB   pbias iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=4 nf=1 m=1
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10000 L=4 nf=1 m=1

XNSINK out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=4 nf=1 m=1
XPSRC  out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10000 L=4 nf=1 m=1

RVB1 vb1 pbias 1
RVB2 vb2 pbias 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
