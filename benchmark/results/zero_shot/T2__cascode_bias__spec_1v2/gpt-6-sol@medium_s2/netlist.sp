.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current establishes the NMOS mirror gate voltage.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=3 nf=1 m=1
XNBIAS vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=3 nf=1 m=1
XPBIAS vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=3 nf=1 m=1

* Unloaded bias outputs share the corresponding mirror gate voltages.
RVB2 vb1 vb2 1m
RVB3 iin vb3 1m
RVB4 iin vb4 1m

XNOUT out vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=3 nf=1 m=1
XPOUT out vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=3 nf=1 m=1
.ends dut
