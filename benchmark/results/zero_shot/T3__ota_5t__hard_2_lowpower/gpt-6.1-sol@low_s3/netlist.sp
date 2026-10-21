.subckt dut iref inp inn out
* Reference-current mirror and PMOS tail-bias generator.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.8 L=2 nf=1 m=1
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=76 L=1 nf=1 m=1

* PMOS differential pair with NMOS current-mirror load.
* Increasing inp reduces the output pull-down current.
XMPINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XMPINN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNLOAD2 out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
