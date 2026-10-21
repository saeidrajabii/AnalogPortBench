.subckt dut in out
XREF_LO bias bias 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=150
XREF_HI in in bias 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=3 nf=1 m=900
XOUT_LO mid bias 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=150
XOUT_HI out in mid 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=3 nf=1 m=900
.ends dut
