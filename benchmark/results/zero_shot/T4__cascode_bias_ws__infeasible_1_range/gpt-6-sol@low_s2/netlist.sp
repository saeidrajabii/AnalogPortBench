.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference mirror: the reference current enters a diode-connected drain.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=0.5 nf=1 m=1
XNPBIAS vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=0.5 nf=1 m=1
XNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=0.5 nf=1 m=1

* The mirrored current establishes the PMOS reference bias.
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=0.5 nf=1 m=1
XPOUT out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=0.5 nf=1 m=1

* Unloaded bias outputs.
RVB2 vb2 vb1 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
