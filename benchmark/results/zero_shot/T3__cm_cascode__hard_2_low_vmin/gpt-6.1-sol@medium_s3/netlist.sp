* Very-long-channel weak-inversion mirror.
* Area is deliberately unconstrained; verify specifications with the TT models.
.subckt dut in out
XREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=1000 nf=1 m=10000
XOUT out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=1000 nf=1 m=10000
.ends dut
