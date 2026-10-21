.subckt dut iref inp inn out

* Reference-current mirror: nominal 5 uA bias branch.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=4
XNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1

* PMOS mirror supplies the differential-pair tail current.
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=10

* PMOS input pair accommodates the 0.5 V input common mode.
XPINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XPINN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1

* NMOS current-mirror load; inp-to-out gain is non-inverting.
XNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XNLOAD2 out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

.ends dut
