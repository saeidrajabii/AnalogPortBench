.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current flows through a diode-connected NMOS stack.
* The lower two devices establish the sink's cascode biases.
XNREF0 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=3 nf=1 m=1
XNREF1 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=3 nf=1 m=1
XNREF2 iin iin vb3 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=3 nf=1 m=1

* A matched NMOS cascode draws current through the PMOS bias stack.
XNB0 nrefsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=3 nf=1 m=1
XNB1 vb2 vb3 nrefsrc 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=3 nf=1 m=1
XPREF0 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=3 nf=1 m=1
XPREF1 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=3 nf=1 m=1

* Output cascode source and sink.
XNOUT0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=3 nf=1 m=1
XNOUT1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=3 nf=1 m=1
XPOUT0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=3 nf=1 m=1
XPOUT1 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=3 nf=1 m=1
.ends dut
