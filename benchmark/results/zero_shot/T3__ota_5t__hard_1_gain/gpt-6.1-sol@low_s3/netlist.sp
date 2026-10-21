.subckt dut iref inp inn out
* Reference mirror and PMOS bias generator.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1.5 nf=1 m=1

* PMOS differential input stage with NMOS mirror load.
XPT tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XPI mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XPM stage1 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XNL mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XNM stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Inverting output stage.
XPO out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1.5 nf=1 m=1
XNO out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=72 L=1.5 nf=1 m=1

* Series-R Miller compensation.
RZ stage1 comp 2.5k
CC comp out 0.8p
.ends dut
