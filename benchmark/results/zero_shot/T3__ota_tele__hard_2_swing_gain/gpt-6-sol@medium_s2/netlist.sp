.subckt dut iref inp inn out
* 20 uA reference and mirrored bias currents
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1

* Differential input stage with a current-mirror load
XN1 nleft inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.2 nf=1 m=1
XN2 a inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.2 nf=1 m=1
XP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XP2 a nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1

* Common-source output stage and Miller compensation
XOUT out a 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1.2 nf=1 m=1
XPLOAD out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=2 nf=1 m=1
RZ a cm 4k
CC cm out 1.2p
.ends dut
