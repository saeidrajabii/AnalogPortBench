.subckt dut in out
RBIAS in vb 10k

XREF vb vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=8 nf=1 m=1
XMIR nx vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=8 nf=1 m=1
XCAS out in nx 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=8 nf=1 m=1

.ends dut
