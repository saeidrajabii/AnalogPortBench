.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current enters a diode-connected NMOS; it does not
* feed an output transistor source directly.
XNREF iin vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=20 nf=1 m=400

* Bias the NMOS cascode gate slightly above the mirror gate.
RNHI vdd vb3 94Meg
RNLO vb3 vb4 6Meg

* A replica NMOS cascode sinks the PMOS mirror reference current.
XNR0 nref_mid vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=20 nf=1 m=400
XNR1 vb1 vb3 nref_mid 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=20 nf=1 m=400
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=20 nf=1 m=1000

* Bias the PMOS output cascode gate below the mirror gate.
RPHI vb1 vb2 6Meg
RPLO vb2 0 94Meg

* Cascoded sink and source meet at out.
XN0 nmid vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=20 nf=1 m=400
XN1 out vb3 nmid 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=20 nf=1 m=400
XP0 pmid vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=20 nf=1 m=1000
XP1 out vb2 pmid vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=20 nf=1 m=1000
.ends dut
