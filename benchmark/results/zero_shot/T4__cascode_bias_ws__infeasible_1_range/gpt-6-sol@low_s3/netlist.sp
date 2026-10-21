.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current flows through a diode-connected NMOS.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=2 nf=1 m=1
XNSINK out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=2 nf=1 m=1

* A mirrored reference current establishes the PMOS mirror bias.
XNBIAS vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=2 nf=1 m=1
XPREF vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=2 nf=1 m=1
XPSOURCE out vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=2 nf=1 m=1

* Export the two mirror biases on the remaining unloaded bias ports.
RVB1 vb1 vb2 1k
RVB3 vb3 iin 1k
RVB4 vb4 iin 1k
.ends dut
