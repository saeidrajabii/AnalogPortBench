.subckt dut iin out vb1 vb2 vb3 vb4
* Reference current establishes the NMOS cascode biases.
RREF iin vb3 1
XNREF_TOP vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XNREF_BOT vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* A matched NMOS branch establishes the PMOS cascode biases.
XNBIAS_BOT nb vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XNBIAS_TOP vb2 vb3 nb 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XPBIAS_TOP vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XPBIAS_BOT vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Matched cascode source and sink meet at out.
XNOUT_BOT ns vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XNOUT_TOP out vb3 ns 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XPOUT_TOP ps vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XPOUT_BOT out vb2 ps vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
