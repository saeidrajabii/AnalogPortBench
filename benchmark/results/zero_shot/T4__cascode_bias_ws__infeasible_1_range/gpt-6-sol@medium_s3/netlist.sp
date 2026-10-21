.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current is first converted to an NMOS gate bias.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1

* A second NMOS branch establishes the PMOS mirror bias.
XNBIAS vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=1 nf=1 m=1

* Matched output source and sink.
XPOUT out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=1 nf=1 m=1
XNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1

* Expose the two mirror biases on all four bias-output ports.
RVB2 vb2 vb1 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
