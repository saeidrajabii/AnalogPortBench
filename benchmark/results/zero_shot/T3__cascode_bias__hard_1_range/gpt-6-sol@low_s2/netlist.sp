.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference mirror. The reference current enters the diode-connected
* transistor at its drain, not its source.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=8 nf=1 m=20
XNBIAS pbias iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=8 nf=1 m=20
XNSINK out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=8 nf=1 m=20

* The second NMOS branch establishes the PMOS mirror reference.
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=40
XPSOURCE out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=40

* Unloaded bias outputs.
RVB1 vb1 pbias 1m
RVB2 vb2 pbias 1m
RVB3 vb3 iin 1m
RVB4 vb4 iin 1m
.ends dut
