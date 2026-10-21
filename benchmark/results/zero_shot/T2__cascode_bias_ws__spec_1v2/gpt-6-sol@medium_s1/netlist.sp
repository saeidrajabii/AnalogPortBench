.subckt dut iin out vb1 vb2 vb3 vb4
* The input current establishes the NMOS mirror gate voltage.
XNIN iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=3 nf=1 m=1
RNG iin vb4 1m

* A mirrored reference branch establishes the PMOS mirror gate voltage.
XNREFBOT nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=3 nf=1 m=1
XNREFCAS vb1 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=3 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=3 nf=1 m=1

* Bias the cascode gates slightly beyond the respective mirror gates.
RNTOP vdd vb3 57Meg
RNBOT vb3 vb4 10Meg
RPTOP vb1 vb2 15Meg
RPBOT vb2 0 70Meg

* Cascoded current sink and source meet at out.
XNOUTBOT nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=3 nf=1 m=1
XNOUTCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=3 nf=1 m=1
XPOUTTOP psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=3 nf=1 m=1
XPOUTCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=3 nf=1 m=1
.ends dut
