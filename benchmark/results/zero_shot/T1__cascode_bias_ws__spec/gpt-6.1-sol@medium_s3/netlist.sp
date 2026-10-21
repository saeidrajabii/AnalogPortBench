.subckt dut iin out vb1 vb2 vb3 vb4

* Diode-connected NMOS reference; reference current enters its drain.
RREF iin vb4 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=4 nf=1 m=1

* Generate the PMOS current-mirror gate bias.
XNPR vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=4 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=4 nf=1 m=1

* NMOS cascode bias with a current-defined source offset.
XPNB vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=4 nf=1 m=1
XNBD vb3 vb3 nb 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=4 nf=1 m=1
RNB nb 0 8k

* PMOS cascode bias with a current-defined source offset.
XNPB vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=4 nf=1 m=1
XPBD vb2 vb2 pb vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=4 nf=1 m=1
RPB vdd pb 8k

* Cascoded NMOS output current sink.
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=4 nf=1 m=1
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=4 nf=1 m=1

* Cascoded PMOS output current source.
XP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=4 nf=1 m=1
XP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=4 nf=1 m=1

.ends dut
