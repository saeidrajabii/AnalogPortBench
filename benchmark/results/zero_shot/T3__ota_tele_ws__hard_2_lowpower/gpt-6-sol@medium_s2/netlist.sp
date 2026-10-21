.subckt dut iref inp inn out
* Reference current is converted to a gate bias before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=4 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=4 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINP mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=3 nf=1 m=1
XINN gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=3 nf=1 m=1
XLOAD1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=4 nf=1 m=1
XLOAD2 gain mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=4 nf=1 m=1

* Common-source output stage and Miller compensation.
XOUTP out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=175 L=4 nf=1 m=1
RZERO gain comp 6k
CCOMP comp out 1.6p
.ends dut
