.subckt dut iin out vb1 vb2 vb3 vb4
* Reference current establishes the NMOS mirror gate voltage.
RIN iin vb4 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=800 L=4 nf=1 m=1
XNSINK out vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=800 L=4 nf=1 m=1

* An NMOS mirror branch establishes the PMOS mirror gate voltage.
XNBIAS vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=800 L=4 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=4 nf=1 m=1
XPSOURCE out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=4 nf=1 m=1

* Unloaded bias outputs.
RVB2 vb1 vb2 1
RVB3 vb4 vb3 1
.ends dut
