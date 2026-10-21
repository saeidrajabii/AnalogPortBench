.subckt dut iref inp inn out
* Reference-current mirror and PMOS tail-bias generator.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=2 nf=1 m=1
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=2 nf=1 m=8

* PMOS differential pair for the 0.5 V input common mode.
XINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.6 nf=1 m=1
XINN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.6 nf=1 m=1

* NMOS current-mirror active load.
XNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XNLOAD2 out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends dut
