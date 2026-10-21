.subckt dut iref inp inn out
* Reference current is converted to a gate bias before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.8 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.8 nf=1 m=1
XPDI mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=1.2 nf=1 m=1
XPMIR first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=1.2 nf=1 m=1

* Second gain stage and frequency compensation.
XPOUT out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1.2 nf=1 m=1
XNLOAD out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1
RZ first comp 22k
CC comp out 1.05p
.ends dut
