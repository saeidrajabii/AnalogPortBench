.subckt dut in out
XREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=8 nf=1 m=100
XOUT out in 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=8 nf=1 m=85
RSENSE out sense 10meg
RRETURN sense 0 40meg
XBOOST in sense vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.7 L=1 nf=1 m=1
.ends dut
