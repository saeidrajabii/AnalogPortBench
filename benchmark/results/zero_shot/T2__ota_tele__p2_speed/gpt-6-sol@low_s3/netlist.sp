.subckt dut iref inp inn out
* Reference-current mirror and tail bias
XNB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* PMOS bias for the output stage
XNR pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.6 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XN1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.6 nf=1 m=1
XN2 d2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.6 nf=1 m=1
XP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XP2 d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* Common-source output stage and series-null compensation
XN3 out d2 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XP3 out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=1
RC d2 comp 1.4k
CC comp out 0.8p
.ends dut
