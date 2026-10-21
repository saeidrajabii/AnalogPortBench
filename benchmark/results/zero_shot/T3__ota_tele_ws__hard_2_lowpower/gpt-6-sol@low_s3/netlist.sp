.subckt dut iref inp inn out
* Reference current is converted to a bias voltage and mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=1 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINP left inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XINN first inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XPLOAD1 left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XPLOAD2 first left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1

* Second gain stage and Miller compensation.
XGAIN out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.7 nf=1 m=1
RNULL first comp 300
CCOMP comp out 1p
.ends dut
