.subckt dut iref inp inn out
* Reference-current mirror
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1

* NMOS differential input pair and PMOS mirror load
XINP nx inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=44 L=0.65 nf=1 m=1
XINN nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=44 L=0.65 nf=1 m=1
XPL nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=1
XPR nx nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=1

* Common-source output stage with a cascoded current sink
XOUT out nx vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=0.8 nf=1 m=1
XSINK nsink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=0.8 nf=1 m=1
XCASC out vcasc nsink 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=0.6 nf=1 m=1
RBH vdd vcasc 200k
RBL vcasc 0 400k

* Miller compensation with a series nulling resistor
RZ nx ncomp 2k
CC ncomp out 650f
.ends dut
