.subckt dut in out
RREF in 0 978.5

XBP bp bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=2 nf=1 m=1
RBP bp 0 100k
XTAIL tail bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=2 nf=1 m=4

XPREF amp in tail vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=3 nf=1 m=6
XPSENSE load sense tail vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=3 nf=1 m=6
XNLOAD load load 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=5 nf=1 m=10
XNMIR amp load 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=5 nf=1 m=10

XPU gate bp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=2 nf=1 m=2
XPD gate amp 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=4
XOUT out gate sense 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=3 nf=1 m=600
RSENSE sense 0 1k
.ends dut
