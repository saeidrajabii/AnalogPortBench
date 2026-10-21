* Candidate port; performance requires verification with the supplied
* SKY130 models and testbench.
.subckt dut iref inp inn out

* Reference-current mirror and tail bias
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2

* PMOS output-stage bias, generated from a mirrored reference current
XBN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Differential input stage; first-stage output is inverting
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.8 nf=1 m=1
XINN n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.8 nf=1 m=1
XLOAD1 n1 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XLOAD2 n2 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* Inverting second stage; overall inp-to-out polarity is positive
XOUTN out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.7 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=6

* Miller compensation with a series zero-control resistor
RCOMP n1 ncomp 680
CCOMP ncomp out 1p

.ends dut
