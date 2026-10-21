.subckt dut iin out vb1 vb2 vb3 vb4

* Reference-current input and isolated mirror.
XNIREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1
XNTAIL ntail iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1

* Output-dependent compliance limiting in the reference branch.
XNENABLE vb2 out ntail 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=4 nf=1 m=1
XPENABLE pref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1
XPREF vb2 vb2 pref vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=4 nf=1 m=1

* PMOS gate-bias output.
RBP vb1 out 1k

* Replicated PMOS branch generates the NMOS current bias.
XPNBIAS pnref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1
XPCNBIAS vb4 vb2 pnref vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=4 nf=1 m=1
XNNBIAS vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1

* Wide-swing NMOS cascode gate bias.
RBNUP vdd vb3 650k
RBNDN vb3 vb4 100k

* Cascoded output current source.
XPOUT psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20000 L=10 nf=1 m=1
XPCOUT out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=4 nf=1 m=1

* Cascoded output current sink.
XNOUT nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1
XNCOUT out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1

.ends dut
