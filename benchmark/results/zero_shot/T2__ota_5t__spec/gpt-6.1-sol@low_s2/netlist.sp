.subckt dut iref inp inn out
* Reference-current mirror and PMOS tail-bias generator
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.6 nf=1 m=1

* Nominal 40-uA tail current
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.6 nf=1 m=2

* PMOS differential input pair
XMPINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.6 nf=1 m=1
XMPINN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.6 nf=1 m=1

* NMOS current-mirror active load
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=1
XMNLOAD2 out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=1
.ends dut
