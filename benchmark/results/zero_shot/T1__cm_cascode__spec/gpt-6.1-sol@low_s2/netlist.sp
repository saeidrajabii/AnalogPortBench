.subckt dut in out
RBIAS in vb 12k
XREF vb vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1
XMIR vx vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1
XCAS out in vx 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1
.ends dut
