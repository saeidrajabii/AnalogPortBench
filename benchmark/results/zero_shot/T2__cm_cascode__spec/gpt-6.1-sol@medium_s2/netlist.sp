.subckt dut in out
RBIAS in vb 5k
XREF vb vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=20
XMIR vx vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=20
XCAS out in vx 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=20
.ends dut
