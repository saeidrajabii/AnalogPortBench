.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current flows into a diode-connected NMOS. Its gate
* voltage is mirrored to the NMOS sink and the PMOS-bias branch.
RVB4 iin vb4 1
XNREF iin vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=8 nf=1 m=100

* NMOS cascode bias and PMOS reference-current branch.
RNHI vdd vb3 10k
RNLO vb3 iin 10k
XNBIAS nmid vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=8 nf=1 m=100
XNCBIAS vb1 vb3 nmid 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=8 nf=1 m=100
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=12 nf=1 m=100

* PMOS cascode bias.
RPHI vb1 vb2 13k
RPLO vb2 0 87k

* Cascoded source and sink at the output.
XNBASE nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=8 nf=1 m=100
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=8 nf=1 m=100
XPBASE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=12 nf=1 m=100
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=12 nf=1 m=100
.ends dut
