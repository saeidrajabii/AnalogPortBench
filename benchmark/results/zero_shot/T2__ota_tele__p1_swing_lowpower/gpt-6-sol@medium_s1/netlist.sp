.subckt dut iref inp inn out
* Reference-current mirror and bias currents
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XLOAD out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1

* Differential input stage with a PMOS current-mirror load
XINP x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.65 nf=1 m=1
XINN d inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.65 nf=1 m=1
XPDIODE d d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=26 L=1 nf=1 m=1
XPMIR x d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=26 L=1 nf=1 m=1

* Common-source output stage and Miller compensation
XOUT out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
RZ out zc 3k
CC zc x 1.5p
.ends dut
