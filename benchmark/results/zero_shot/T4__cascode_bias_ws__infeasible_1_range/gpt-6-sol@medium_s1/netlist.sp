.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference mirror and output sink.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=100
XNBIAS pbias iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=100
XNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=100

* Diode-connected PMOS establishes the source-mirror bias.
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=10 nf=1 m=100
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=10 nf=1 m=100

* Unloaded bias-voltage outputs.
RVB1 vb1 pbias 1
RVB2 vb2 pbias 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
