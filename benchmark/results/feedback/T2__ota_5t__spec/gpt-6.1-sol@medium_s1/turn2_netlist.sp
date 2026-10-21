.subckt dut iref inp inn out

* Reference-current mirror.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* PMOS tail-current bias.
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* Longer-channel differential pair for increased DC gain.
XPINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1.5 nf=1 m=1
XPINN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1.5 nf=1 m=1

* Longer-channel NMOS current-mirror load.
XNLOAD mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XNOUT out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1

.ends dut
