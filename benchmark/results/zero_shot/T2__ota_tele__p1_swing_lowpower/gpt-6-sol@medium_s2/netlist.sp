.subckt dut iref inp inn out
* Reference-current mirror and tail current
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.7 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=0.7 nf=1 m=1

* First stage: differential pair with current-mirror load
XINP  d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XINN  n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XPL1  d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.9 nf=1 m=1
XPL2  n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.9 nf=1 m=1

* Bias and common-source output stage
XBN   pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=0.7 nf=1 m=1
XBP   pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.7 nf=1 m=1
XPO   out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XNO   out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1

* Miller compensation with a series nulling resistor
RZ n1 nz 1.7k
CC nz out 1.5p
.ends dut
