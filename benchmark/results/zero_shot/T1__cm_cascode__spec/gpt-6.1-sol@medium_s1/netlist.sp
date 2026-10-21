.subckt dut in out
Rbias in vb 10k
XMref vb vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=6 nf=1 m=10
XMmirror nx vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=6 nf=1 m=10
XMcascode out in nx 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=6 nf=1 m=10
.ends dut
