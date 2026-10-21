.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current branch and NMOS cascode biases
XNREF0 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=320 L=1.5 nf=1 m=1
XNREF1 iin iin vb4 0 sky130_fd_pr__nfet_01v8_lvt W=320 L=1.5 nf=1 m=1
RBIAS iin vb3 1

* Mirror the reference current to generate PMOS cascode biases
XNB0 nrefp vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=320 L=1.5 nf=1 m=1
XNB1 vb2 vb3 nrefp 0 sky130_fd_pr__nfet_01v8_lvt W=320 L=1.5 nf=1 m=1
XPREF0 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=480 L=1.5 nf=1 m=1
XPREF1 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=480 L=1.5 nf=1 m=1

* Cascoded output sink and source
XNOUT0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=320 L=1.5 nf=1 m=1
XNOUT1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=320 L=1.5 nf=1 m=1
XPOUT0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=480 L=1.5 nf=1 m=1
XPOUT1 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=480 L=1.5 nf=1 m=1
.ends dut
