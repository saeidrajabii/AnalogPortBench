.subckt dut in out
* Reference and output mirror devices.
XMREF in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=4 nf=1 m=1
XMOUT ncas in 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=4 nf=1 m=1

* Low-voltage output cascode.
XMCAS out vb ncas 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1

* Independent cascode-gate bias.
RBIAS vdd vb 68k
XMBIAS vb vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=2 nf=1 m=1
.ends dut
