.subckt dut in out
* Reference-current sink and matched sink branch
XMREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMBIAS pb in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* PMOS current mirror: the reference branch establishes the output gate bias
XPMREF pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XPMOUT out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
.ends dut
