.subckt dut iin out vb1 vb2 vb3 vb4
* The input current establishes the NMOS mirror bias.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6000 L=100 nf=1 m=1
XNBIAS pb vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6000 L=100 nf=1 m=1
XNOUT out vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=6000 L=100 nf=1 m=1

* The mirrored current establishes the PMOS mirror bias.
XPREF pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18000 L=100 nf=1 m=1
XPOUT out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18018 L=100 nf=1 m=1

* Expose the two mirror biases on the four unloaded bias ports.
RVB1 vb1 pb 1
RVB2 vb2 pb 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
