.subckt dut iref inp inn out
* Reference-current mirror
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=1.2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5.4 L=1.2 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20.25 L=1.2 nf=1 m=1

* Differential input stage and active load
XINP x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.6 nf=1 m=1
XINN n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.6 nf=1 m=1
XLOAD1 x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=1.2 nf=1 m=1
XLOAD2 n1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=1.2 nf=1 m=1

* Common-source output stage with Miller compensation
XOUTP out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=105 L=1.2 nf=1 m=1
RZ n1 nc 2k
CC nc out 0.7p
.ends dut
