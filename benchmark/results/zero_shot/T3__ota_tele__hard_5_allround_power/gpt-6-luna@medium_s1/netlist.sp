.subckt dut iref inp inn out
* Reference-current mirror and PMOS bias reference
XREF   iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XTAIL  tail iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XBN    pb   iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XPB    pb   pb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* NMOS differential input pair with PMOS current-mirror load
XINP   nl   inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XINN   n1   inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPL1   nl   nl   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XPL2   n1   nl   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* PMOS common-source output stage and NMOS current sink
XP2    out  n1   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.8 nf=1 m=1
XN2    out  iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* Miller compensation with a series nulling resistor
RZ     n1   nc   1.2k
CC     nc   out  1p
.ends dut
