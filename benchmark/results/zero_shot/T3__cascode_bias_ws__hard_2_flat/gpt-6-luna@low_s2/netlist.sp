.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current sensing and NMOS mirror. The input current enters the
* drain/gate of XMREF, not the source of a transistor.
XMREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XMNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XMNCASC out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

* PMOS reference branch, fed by a mirrored copy of the reference current.
XMNDREF ndref iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XMPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMPFEED ndref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMPCASC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* Bias outputs. The reference-connected gates provide vb1 and vb4;
* these resistive dividers establish the cascode gate biases.
RNB1 vb4 vb3 10k
RNB2 vb3 vdd 10k
RPB1 vb1 vb2 10k
RPB2 vb2 0 10k
.ends dut
