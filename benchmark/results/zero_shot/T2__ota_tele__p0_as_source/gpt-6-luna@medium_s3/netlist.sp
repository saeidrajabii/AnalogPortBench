.subckt dut iref inp inn out
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.6 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.6 nf=1 m=1

XINL xl inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XINR x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1

XPL xl xl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1.0 nf=1 m=1
XPR x1 xl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1.0 nf=1 m=1

XBN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.6 nf=1 m=1
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1.0 nf=1 m=1
XLOAD out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1.0 nf=1 m=1
XOUT out x1 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.0 nf=1 m=1

CC x1 ncomp 0.5p
RZ ncomp out 1.5k
.ends dut
