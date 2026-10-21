.subckt dut iref inp inn out
* Reference-current mirror and tail-current source.
XBN iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XBT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1

* Output-stage bias.
XBPNS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XBPP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=3 nf=1 m=1

* Differential input stage and current-mirror load.
XIN1 nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=3 nf=1 m=1
XIN2 x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=3 nf=1 m=1
XPL1 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=65 L=4 nf=1 m=1
XPL2 x nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=65 L=4 nf=1 m=1

* Common-source output stage with Miller compensation.
XOUTN out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=3 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=3 nf=1 m=1
RCOMP x xc 800
CCOMP xc out 0.8p
.ends dut
