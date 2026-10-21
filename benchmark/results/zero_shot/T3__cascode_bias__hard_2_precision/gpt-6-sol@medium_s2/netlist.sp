.subckt dut iin out vb1 vb2 vb3 vb4
* The input current establishes the NMOS mirror gate voltage.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=200 nf=1 m=400
RNBIAS iin vb4 1
RNBIAS2 vb4 vb3 1

* An identical NMOS sinks the PMOS reference current.
XNBIAS pref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=200 nf=1 m=400

* A high-resistance divider biases the PMOS reference gate while
* drawing negligible current from the reference branch.
RPTOP pref vb1 10g
RPBOT vb1 0 45.56g
RPBIAS vb1 vb2 1
XPREF pref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=200 nf=1 m=400

* Output source and sink.
XNSINK out vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=200 nf=1 m=400
XPSOURCE out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=200 nf=1 m=400
.ends dut
