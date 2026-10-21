.subckt dut iref inp inn out
* Reference-current mirror
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.7 nf=1 m=1

* Differential input stage
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.4 L=0.7 nf=1 m=1
XN1 pgate inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.8 nf=1 m=1
XN2 first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=108 L=0.8 nf=1 m=1
XP1 pgate pgate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XP2 first pgate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Second gain stage
XP3 out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1 nf=1 m=1
XN3 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.7 nf=1 m=1

* Miller compensation
RZ first comp 1k
CC comp out 0.22p
.ends dut
