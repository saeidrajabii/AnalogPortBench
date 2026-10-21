.subckt dut iref inp inn out
* Reference-current input and NMOS bias mirror
XREF  vbn  vbn  0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XTAIL tail vbn 0    0    sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1

* NMOS differential input pair and PMOS current-mirror load
XINP  ndp  inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XINN  ndm  inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XPL1  ndp  ndp  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XPL2  n1   ndp  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1

* PMOS bias branch and second-stage current-source mirror
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XNBIAS pbias vbn   0   0   sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* Common-source second stage
XOUTN out n1 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* Miller compensation
RCOMP n1 ncomp 4k
CCOMP ncomp out 1p
.ends dut
