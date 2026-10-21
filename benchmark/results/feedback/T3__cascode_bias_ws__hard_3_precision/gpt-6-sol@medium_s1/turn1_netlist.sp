.subckt dut iin out vb1 vb2 vb3 vb4
* Long-channel mirrors reduce output-voltage-dependent current error.
* The reference current enters the drain of the diode-connected NMOS.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=3000 L=30 nf=1 m=1
XNBIAS vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=3000 L=30 nf=1 m=1
XNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=3000 L=30 nf=1 m=1

XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3000 L=30 nf=1 m=1
XPOUT out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3000 L=30 nf=1 m=1

* Export the two mirror biases on the four required bias ports.
RVB2 vb1 vb2 1
RVB3 iin vb3 1
RVB4 iin vb4 1
.ends dut
