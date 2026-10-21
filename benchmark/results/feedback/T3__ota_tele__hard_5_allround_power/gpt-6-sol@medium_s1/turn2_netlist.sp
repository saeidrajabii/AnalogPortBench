.subckt dut iref inp inn out
* Reference current is mirrored into the tail and output sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=11 L=0.8 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=42 L=1.2 nf=1 m=1

* Differential input stage and PMOS mirror load.
XINP x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=0.7 nf=1 m=1
XINN d inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=0.7 nf=1 m=1
XPDI d d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.6 nf=1 m=1
XPMIR x d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.6 nf=1 m=1

* Output stage and Miller compensation.
XPOUT out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.2 nf=1 m=1
RZ x cz 6k
CC cz out 0.55p
.ends dut
