.subckt dut iref inp inn out
* Reference-current mirror and bias generation
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1 nf=1 m=1

* Differential input stage with a PMOS current-mirror load
XINN nleft inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.6 nf=1 m=1
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.6 nf=1 m=1
XPLEFT nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.8 nf=1 m=1
XPRIGHT n1 nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.8 nf=1 m=1

* Common-source output stage and Miller compensation
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XNOUT out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
RZ n1 nc 3k
CC nc out 0.8p
.ends dut
