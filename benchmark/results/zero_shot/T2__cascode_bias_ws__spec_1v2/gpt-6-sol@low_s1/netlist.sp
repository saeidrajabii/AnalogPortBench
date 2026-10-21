.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current mirror.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=3 nf=1 m=1
XNBIAS vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=3 nf=1 m=1

* PMOS mirror biased by the mirrored reference current.
XPREF vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=3 nf=1 m=1

* Output current source and sink.
XPOUT out vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=3 nf=1 m=1
XNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=3 nf=1 m=1

* Unloaded bias-voltage outputs.
RVB1 vb1 vb2 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
