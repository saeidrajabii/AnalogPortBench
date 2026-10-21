.subckt dut iin out vb1 vb2 vb3 vb4
* Diode-connected reference device; the reference current enters its drain.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=30
XNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=30

* A matched branch transfers the mirrored current to the PMOS reference.
XNCOPY vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=30
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=20 nf=1 m=30
XPOUT out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=20 nf=1 m=30

* Unloaded bias-voltage outputs.
RVB2 vb2 vb1 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
