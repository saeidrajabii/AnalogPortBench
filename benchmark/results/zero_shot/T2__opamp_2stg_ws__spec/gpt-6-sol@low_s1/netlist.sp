.subckt dut iref inp inn out
* Reference current enters a diode-connected NMOS and is mirrored to the
* input-stage tail and the PMOS output-stage bias branch.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=0.6 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.6 nf=1 m=1
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=0.6 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=1

* NMOS differential input stage with a PMOS current-mirror load.
XINM pdiode inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1.0 nf=1 m=1
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1.0 nf=1 m=1
XPL pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1.2 nf=1 m=1
XPR n1 pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1.2 nf=1 m=1

* Common-source output stage and Miller compensation.
XOUT out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.0 nf=1 m=1
XLOAD out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1.2 nf=1 m=1
RZ n1 ccomp 1k
CC ccomp out 550f
.ends dut
