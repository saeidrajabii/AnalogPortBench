.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and mirrored gate-bias output.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=800 L=8 nf=1 m=1
RNB iin vb4 1

* Generate the PMOS mirror reference from a mirrored input current.
XNPR vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=800 L=8 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2400 L=8 nf=1 m=1

* NMOS cascode bias: resistor-offset diode-connected replica.
XPNB vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2400 L=8 nf=1 m=1
XNCB vb3 vb3 nrep 0 sky130_fd_pr__nfet_01v8_lvt W=800 L=8 nf=1 m=1
RNCB nrep 0 6k

* PMOS cascode bias: resistor-offset diode-connected replica.
XNPB vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=800 L=8 nf=1 m=1
XPCB vb2 vb2 prep vdd sky130_fd_pr__pfet_01v8_lvt W=2400 L=8 nf=1 m=1
RPCB vdd prep 6k

* Cascoded output current sink.
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=800 L=8 nf=1 m=1
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=800 L=8 nf=1 m=1

* Cascoded output current source.
XP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2400 L=8 nf=1 m=1
XP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=2400 L=8 nf=1 m=1

.ends dut
