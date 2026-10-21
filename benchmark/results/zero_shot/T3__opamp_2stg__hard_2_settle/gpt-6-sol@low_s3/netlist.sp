.subckt dut iref inp inn out
* Reference current is converted to a gate bias, then mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XTAIL tail bias 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XOUTBIAS out bias 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
RBIAS iref bias 1

* NMOS differential pair with PMOS current-mirror load.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XINN gain inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XPLOAD1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1 nf=1 m=1
XPLOAD2 gain mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XPOUT out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.7 nf=1 m=1
RZERO gain comp 700
CCOMP comp out 450f
.ends dut
