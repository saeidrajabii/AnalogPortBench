.subckt dut iin out vb1 vb2 vb3 vb4
* The input current establishes the NMOS mirror bias.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=8 nf=1 m=1
XNBIAS vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=8 nf=1 m=1

* The mirrored current establishes the PMOS mirror bias.
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=480 L=8 nf=1 m=1

* Matched source and sink meet at out.
XPSRC out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=480 L=8 nf=1 m=1
XNSINK out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=8 nf=1 m=1

* Expose the mirror biases on all four required bias ports.
RVB2 vb2 vb1 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
