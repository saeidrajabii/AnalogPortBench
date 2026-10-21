.subckt dut in out
XMREF x x 0 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=10 nf=1 m=1
XMBIAS in in x x sky130_fd_pr__nfet_01v8_lvt W=4000 L=10 nf=1 m=1
XMOUT y x 0 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=10 nf=1 m=1
XMCAS out vb y 0 sky130_fd_pr__nfet_01v8_lvt W=4000 L=10 nf=1 m=1
RLOW x vb 700k
RHIGH vb in 100k
.ends dut
