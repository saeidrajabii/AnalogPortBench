.subckt dut iref inp inn out
* Reference-current mirror
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=2
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=4

* Differential input stage with PMOS current-mirror load
XINP left inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XINN first inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XLOAD1 left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1
XLOAD2 first left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1

* Common-source output stage and Miller compensation
XOUT out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.35 nf=1 m=1
RZ first comp 1k
CC comp out 1.2p
.ends dut
