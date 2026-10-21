.subckt dut iref inp inn out
* Reference-current mirror
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=2
XBIAS pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1

* PMOS bias and second-stage current source
XPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPLOAD out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=4

* Differential input stage with current-mirror load
XNINP nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XNINN first inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPMD nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XPMO first nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Common-source output stage and Miller compensation
XNOUT out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
RZ first comp 250
CC comp out 1.2p
.ends dut
