.subckt dut iref inp inn out
* Reference current is converted to a gate bias and mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8.4 L=0.8 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10.5 L=0.8 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINN nl inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XPL nl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=0.8 nf=1 m=1
XPR n1 nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=0.8 nf=1 m=1

* Common-source output stage and Miller compensation.
XOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=42 L=0.5 nf=1 m=1
RZ n1 nc 400
CC nc out 1.3p
.ends dut
