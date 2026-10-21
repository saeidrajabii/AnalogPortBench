.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference mirror and bias generation
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=800 L=8 nf=1 m=1
XN1 n1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=800 L=8 nf=1 m=1
XN2 vb1 vb1 n1 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=0.5 nf=1 m=1
XN3 n2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=800 L=8 nf=1 m=1
XN4 vb2 vb2 n2 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=0.5 nf=1 m=1

* PMOS reference mirror and cascode biases
* MPBIAS is diode-connected; the reference current reaches it through
* the NMOS mirror rather than flowing into a transistor source at iin.
XPBIAS vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=3 nf=1 m=1
XP1 p1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=800 L=4 nf=1 m=1
XP2 vb1 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=250 L=0.5 nf=1 m=1
XP3 p2 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=800 L=4 nf=1 m=1
XP4 vb3 vb2 p2 vdd sky130_fd_pr__pfet_01v8_lvt W=250 L=0.5 nf=1 m=1
XP5 p3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=800 L=4 nf=1 m=1
XP6 vb4 vb2 p3 vdd sky130_fd_pr__pfet_01v8_lvt W=250 L=0.5 nf=1 m=1

* NMOS wide-swing cascode bias
XN5 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=3 nf=1 m=1
XN6 n3 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=800 L=8 nf=1 m=1
XN7 vb4 vb3 n3 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=0.5 nf=1 m=1

* Matched output current source and sink
XNOUT0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=800 L=8 nf=1 m=1
XNOUT1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=0.5 nf=1 m=1
XPOUT0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=800 L=4 nf=1 m=1
XPOUT1 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=250 L=0.5 nf=1 m=1
.ends dut
