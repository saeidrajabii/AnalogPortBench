.subckt dut in out
XREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=35 nf=1 m=440
XMAIN out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=35 nf=1 m=440

XBOOST out boost 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=2 nf=1 m=1
XBIAS boost out vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=1 nf=1 m=1
RBIAS boost 0 50k
.ends dut
