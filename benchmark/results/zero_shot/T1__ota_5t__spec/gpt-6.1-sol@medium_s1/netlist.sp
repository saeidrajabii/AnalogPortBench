.subckt dut iref inp inn out

* Reference-current mirror: nominal 2 uA auxiliary bias.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=2 nf=1 m=1

* PMOS bias mirror: nominal 36 uA differential-pair current.
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=2 nf=1 m=1
XPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=2 nf=1 m=1

* PMOS input pair accommodates the 0.5 V input common mode.
XPINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XPINN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* NMOS current-mirror load; positive gain from inp to out.
XNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XNLOAD2 out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1

.ends dut
