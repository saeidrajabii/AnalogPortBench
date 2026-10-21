.subckt dut in out

XREF in in vref 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=20
RREF vref 0 1k
XOUT out vg vsense 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=20
ROUT vsense 0 1k

XBIASN vb in 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XBIASP vb vb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=10
XTAIL vtail vb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=25

XDP1 vm vref vtail vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=20
XDP2 vg vsense vtail vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=20
XLOAD1 vm vm 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=10
XLOAD2 vg vm 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=10

CCOMP vg 0 10p

.ends dut
