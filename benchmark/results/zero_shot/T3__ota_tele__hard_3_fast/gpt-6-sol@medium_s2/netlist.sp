.subckt dut iref inp inn out
* Reference-current mirror and tail bias
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=0.5 nf=1 m=2

* PMOS bias for the output-stage current source
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Differential input stage with a current-mirror load
XNINP d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XNINN v1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XPLOAD1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
XPLOAD2 v1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1

* Common-source output stage and series-RC Miller compensation
XNOUT out v1 0 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=0.35 nf=1 m=1
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
RZ v1 ccomp 2.4k
CC ccomp out 0.72p
.ends dut
