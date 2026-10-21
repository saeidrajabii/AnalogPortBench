.subckt dut iref inp inn out

* Reference-current mirror: nominal 20 uA reference, 1 uA bias branch.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.5 L=1 nf=1 m=1

* PMOS mirror supplies a nominal 40 uA differential-pair tail current.
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1

* PMOS input pair accommodates the 0.5 V input common-mode voltage.
XMPINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMPINN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* NMOS current-mirror load; inp-to-out gain is non-inverting.
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNLOAD2 out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

.ends dut
