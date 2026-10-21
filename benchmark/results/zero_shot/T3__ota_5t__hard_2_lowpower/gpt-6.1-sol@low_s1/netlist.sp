.subckt dut iref inp inn out
* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16.8 L=1 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=1 nf=1 m=1

* PMOS bias diode and differential-pair tail source.
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* PMOS differential input pair.
XINP out inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.35 nf=1 m=1
XINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.35 nf=1 m=1

* NMOS current-mirror active load.
XNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XNLOAD2 out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
