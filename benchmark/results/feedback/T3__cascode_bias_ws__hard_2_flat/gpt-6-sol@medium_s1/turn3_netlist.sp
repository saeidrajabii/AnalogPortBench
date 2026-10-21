.subckt dut iin out vb1 vb2 vb3 vb4
RIN iin vb4 1m
XNREF iin vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=20 nf=1 m=400

RNHI vdd vb3 80Meg
RNLO vb3 vb4 20Meg
RPHI vb1 vb2 20Meg
RPLO vb2 0 80Meg

XNR0 nref_mid vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=20 nf=1 m=400
XNR1 vb1 vb3 nref_mid 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=20 nf=1 m=400
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=20 nf=1 m=1000

XN0 nmid vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=20 nf=1 m=400
XN1 out vb3 nmid 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=20 nf=1 m=400
XP0 pmid vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=20 nf=1 m=1036
XP1 out vb2 pmid vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=20 nf=1 m=1036
.ends dut
