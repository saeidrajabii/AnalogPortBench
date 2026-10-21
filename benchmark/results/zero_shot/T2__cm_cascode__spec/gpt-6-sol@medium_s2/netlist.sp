.subckt dut in out
* The resistor raises the cascode-gate bias above the mirror-gate bias.
RBIAS in ngate 9k
XREF ngate ngate 0 0 sky130_fd_pr__nfet_01v8_lvt W=360 L=8 nf=1 m=1
XMIR nmid ngate 0 0 sky130_fd_pr__nfet_01v8_lvt W=370 L=8 nf=1 m=1
XCAS out in nmid 0 sky130_fd_pr__nfet_01v8_lvt W=360 L=8 nf=1 m=1
.ends dut
