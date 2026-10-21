.subckt dut iref inp inn out
* Reference current is diode-connected and mirrored into the input-pair tail.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=2

* Differential input stage with a PMOS current-mirror load.
XINP pdiode inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.7 nf=1 m=1
XINN first inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.7 nf=1 m=1
XPL pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XPR first pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XOUTN out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=0.5 nf=1 m=1
XOUTP out pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=0.7 nf=1 m=1
RZ first comp 250
CC comp out 1.8p
.ends dut
