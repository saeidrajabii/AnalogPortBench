.subckt dut iref inp inn out
* Bias reference and current mirrors
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=13 L=0.8 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=0.8 nf=1 m=1

* Differential input stage with PMOS mirror load
XINP x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XINN d inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPDI d d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XPMIR x d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* Output stage and series-RC Miller compensation
XPOUT out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=42 L=0.8 nf=1 m=1
RZ x cz 6k
CC cz out 0.55p
.ends dut
