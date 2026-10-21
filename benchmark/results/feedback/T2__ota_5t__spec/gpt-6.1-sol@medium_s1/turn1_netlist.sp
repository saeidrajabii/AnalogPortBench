.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference, nominal 10 uA bias.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* PMOS bias mirror: nominal 40 uA differential-pair tail current.
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* PMOS differential pair for the 0.5 V input common mode.
XPINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XPINN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* NMOS current-mirror load; inp-to-out gain is non-inverting.
XNLOAD mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XNOUT out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

.ends dut
