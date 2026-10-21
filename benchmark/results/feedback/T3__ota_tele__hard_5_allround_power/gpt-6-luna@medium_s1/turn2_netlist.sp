.subckt dut iref inp inn out
* Reference-current mirror
XREF   iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XTAIL  tail iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=0.8 L=1.5 nf=1 m=1

* PMOS bias reference and second-stage load mirror
XBN    pb   iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XPB    pb   pb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XINP   nl   inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XINN   n1   inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XPL1   nl   nl   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XPL2   n1   nl   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Common-source second stage
XP2    out  pb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1.5 nf=1 m=1
XN2    out  n1   0   0   sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1

* Miller compensation
RZ     n1   nc   2k
CC     nc   out  0.25p
.ends dut
