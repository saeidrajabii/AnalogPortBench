.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current establishes the NMOS mirror bias.
RREF iin vb4 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1
XNSINK out vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1

* A mirrored reference current establishes the PMOS mirror bias.
XNBIAS vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1
XPBIAS vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=4 nf=1 m=1
XPSOURCE out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=4 nf=1 m=1

* Provide the remaining unloaded bias outputs.
RB2 vb1 vb2 1
RB3 vb4 vb3 1
.ends dut
