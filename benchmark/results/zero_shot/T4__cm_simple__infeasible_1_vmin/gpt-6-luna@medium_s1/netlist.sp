.subckt dut in out
XNREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1
XNMIR nb in 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=1
XPREF nb nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=10 nf=1 m=1
XPOUT out nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=10 nf=1 m=1
.ends dut
