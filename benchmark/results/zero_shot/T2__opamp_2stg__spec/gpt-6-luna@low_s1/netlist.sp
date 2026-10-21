.subckt dut iref inp inn out
* Reference-current mirror and PMOS-load bias
XMR0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMB0 pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMB1 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Differential input stage and current-mirror active load
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XINP n1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XINN n2 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPL1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XPL2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Common-source output stage
XOUTN out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XOUTP out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Miller compensation
CCOMP n2 ncomp 1p
RCOMP ncomp out 2k
.ends dut
