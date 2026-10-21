.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current establishes the NMOS mirror gate voltage.
XNR iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
RNG iin vb4 1

* Generate the PMOS mirror bias from an NMOS mirror branch.
XNP vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XPR vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=2

* Offset the cascode gate biases using nominal 20-uA branches.
XPC vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
RNBIAS vb3 vb4 9k
RPBIAS vb1 vb2 9k
XNC vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* Complementary cascode output branches.
XNO nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XPO psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
.ends dut
