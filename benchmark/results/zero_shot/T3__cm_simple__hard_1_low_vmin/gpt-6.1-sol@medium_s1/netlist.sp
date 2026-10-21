.subckt dut in out

* Reference branch and matched current-sense resistors
XREF in in vref 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1
RREF vref 0 1k
XOUT out vg vsense 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1
ROUT vsense 0 1k

* Mirror-derived amplifier bias
XBIASN vb in 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=10 nf=1 m=1
XBIASP vb vb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=2 nf=1 m=1
XTAIL vtail vb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=500 L=2 nf=1 m=1

* Feedback amplifier: regulate vsense to vref
XDP1 vm vref vtail vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=10 nf=1 m=1
XDP2 vg vsense vtail vdd sky130_fd_pr__pfet_01v8_lvt W=2000 L=10 nf=1 m=1
XLOAD1 vm vm 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=20 nf=1 m=1
XLOAD2 vg vm 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=20 nf=1 m=1

* Dominant-pole compensation
CCOMP vg 0 10p

.ends dut
