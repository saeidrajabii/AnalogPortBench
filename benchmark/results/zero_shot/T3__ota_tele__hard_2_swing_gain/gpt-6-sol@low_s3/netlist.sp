.subckt dut iref inp inn out
* Reference-current mirror
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.4 L=1 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1

* PMOS bias for the output stage
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* Differential input stage and current-mirror load
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XINN n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XLOAD1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XLOAD2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* Common-source output stage and Miller compensation
XOUT out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.8 nf=1 m=1
XPULL out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1 nf=1 m=1
RZ n2 nc 500
CC nc out 0.65p
.ends dut
