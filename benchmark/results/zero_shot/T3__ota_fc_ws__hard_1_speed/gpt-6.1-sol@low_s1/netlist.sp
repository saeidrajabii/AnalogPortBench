.subckt dut iref inp inn out

* Reference-current mirror: nominal tail current is 160 uA.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=8

* Low-overdrive differential input pair.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=1.5 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=1.5 nf=1 m=1

* PMOS active load; the output is non-inverting with respect to inp.
XPD mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=1.4 nf=1 m=1
XPO out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=1.4 nf=1 m=1

.ends dut
