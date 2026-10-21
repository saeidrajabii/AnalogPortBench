.subckt dut iref inp inn out
* Reference current is converted to a gate bias before being mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=0.5 nf=1 m=1
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.7 nf=1 m=1

* Differential input stage and current-mirror load.
XINP left inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.7 nf=1 m=1
XINN first inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.7 nf=1 m=1
XPDIOD left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.7 nf=1 m=1
XPMIR first left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.7 nf=1 m=1

* Common-source output stage and Miller compensation.
XOUT out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.7 nf=1 m=1
XPLOAD out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.7 nf=1 m=1
RNULL first comp 700
CCOMP comp out 800f
.ends dut
