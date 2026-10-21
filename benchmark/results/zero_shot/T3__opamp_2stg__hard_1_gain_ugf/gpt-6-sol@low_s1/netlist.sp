.subckt dut iref inp inn out
* Reference current is converted to a gate bias before being mirrored.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* Differential input stage and PMOS current-mirror load.
XBTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=2
XBIN x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=65 L=0.7 nf=1 m=1
XBFBR pdiode inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=65 L=0.7 nf=1 m=1
XBPD pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=1.5 nf=1 m=1
XBPM x pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=1.5 nf=1 m=1

* Common-source output stage and Miller compensation.
XBOUTP out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=250 L=1.2 nf=1 m=1
XBOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=66 L=1 nf=1 m=1
RZ x ccnode 1k
CC ccnode out 650f
.ends dut
