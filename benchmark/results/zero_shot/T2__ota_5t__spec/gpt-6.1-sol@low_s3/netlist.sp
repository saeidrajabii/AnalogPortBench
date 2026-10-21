.subckt dut iref inp inn out
* Reference-current mirror: 20 uA reference, nominal 10 uA bias branch.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS bias mirror: nominal 60 uA differential-pair tail current.
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.6 nf=1 m=1

* PMOS input pair for the 0.5 V input common-mode voltage.
XMPINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.8 nf=1 m=1
XMPINN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.8 nf=1 m=1

* NMOS current-mirror load; inp-to-out polarity is non-inverting.
XMNLOAD mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMNOUT out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
.ends dut
