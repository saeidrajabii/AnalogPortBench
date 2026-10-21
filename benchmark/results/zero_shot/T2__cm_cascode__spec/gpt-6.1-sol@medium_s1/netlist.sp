.subckt dut in out
RSHIFT in nref 10k
RGATE in vcas 1k

XREF nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=20 nf=1 m=10
XMIR nmid nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=20 nf=1 m=10
XCAS out vcas nmid 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=20 nf=1 m=10
.ends dut
