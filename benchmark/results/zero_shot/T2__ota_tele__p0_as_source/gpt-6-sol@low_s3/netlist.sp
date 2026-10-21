.subckt dut iref inp inn out
* Reference-current mirror and bias generation
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.7 nf=1 m=1
XBPM  pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XBNPM pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.7 nf=1 m=1

* Differential input stage
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XINP  a inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XINN  b inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XPL   b b vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XPR   a b vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1

* Output stage and Miller compensation
XOUTN out a 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.7 nf=1 m=1
XOUTP out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.7 nf=1 m=1
RZ a cz 700
CC cz out 1.2p
.ends dut
