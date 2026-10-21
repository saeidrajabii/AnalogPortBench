.subckt dut iref inp inn out
* Reference-current mirror: nominal 20 uA input, 10 uA bias branch.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1

* PMOS bias mirror and nominal 30 uA differential-pair tail.
XPR pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1 nf=1 m=1
XPT tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1 nf=1 m=3

* PMOS differential input pair.
XPI mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1 nf=1 m=1
XPN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1 nf=1 m=1

* NMOS current-mirror load.
XNL mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XNO out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
