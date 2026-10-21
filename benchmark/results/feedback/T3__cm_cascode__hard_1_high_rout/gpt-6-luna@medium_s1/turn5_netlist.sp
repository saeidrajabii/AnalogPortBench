.subckt dut in out
XMREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMOUT nx in 0 0 sky130_fd_pr__nfet_01v8_lvt W=9.58 L=1 nf=1 m=1
XMCAS out vb nx 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
RHI vdd vb 100k
RLO vb 0 100k
.ends dut
