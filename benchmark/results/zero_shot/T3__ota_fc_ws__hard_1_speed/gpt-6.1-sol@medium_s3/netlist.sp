.subckt dut iref inp inn out

* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=2 nf=1 m=1
XMNBias pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=2 nf=1 m=1

* PMOS bias mirror and differential-pair current source.
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=8

* PMOS differential pair.
XMPINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=1 nf=1 m=1
XMPINN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=1 nf=1 m=1

* NMOS current-mirror load; inp is the non-inverting input.
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMNLOAD2 out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1

.ends dut
