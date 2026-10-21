.subckt dut iref inp inn out
* 20 uA NMOS reference and mirrored bias sinks
XREF   iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XTAIL  tail iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XNB    pb   iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1

* PMOS bias reference
XPREF  pb   pb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load
XINP   nl   inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XINN   n1   inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XPL1   nl   nl   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XPL2   n1   nl   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* PMOS common-source output stage with mirrored NMOS sink
XP2    out  n1   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XN2    out  iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Miller compensation and series nulling resistor
RZ     n1   nc   1.5k
CC     nc   out  0.6p
.ends dut
