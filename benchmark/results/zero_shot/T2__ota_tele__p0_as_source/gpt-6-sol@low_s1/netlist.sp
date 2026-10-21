.subckt dut iref inp inn out
* Reference-current mirror
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XBN pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XBP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1

* Differential input stage
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.35 nf=1 m=1
XINN x inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.35 nf=1 m=1
XPL n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XPR x n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* Output stage and compensation
XOP out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=64 L=0.5 nf=1 m=1
XON out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=0.35 nf=1 m=1
RZ x cc 600
CC cc out 1.4p
.ends dut
