.subckt dut iref inp inn out

* Reference-current mirror.
XBN iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* Nominal 10-uA PMOS bias-reference branch.
XBR pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1

* PMOS differential pair with nominal 20-uA tail current.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1

* NMOS current-mirror first-stage load.
XLD mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XLM stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* Common-source output stage, nominally biased at 20 uA.
XOUT out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XLOAD out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP stage1 comp 3k
CCOMP comp out 1.2p

.ends dut
