.subckt dut iref inp inn out
* Reference-current sink and NMOS mirrors
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1

* PMOS mirror load for the input differential pair
XPL xlp xlp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1.5 nf=1 m=1
XPR x1 xlp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1.5 nf=1 m=1
XINP xlp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XINN x1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1

* PMOS bias branch and 4:1 output-stage current mirror
XBN pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XPBD pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XPOUT out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XNS out x1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1

* Miller compensation
RZ x1 ncomp 1k
CC ncomp out 400f
.ends dut
