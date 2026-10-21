.subckt dut iref inp inn out
* Reference-current mirror
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=1

* Differential input stage with current-mirror load
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.8 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.8 nf=1 m=1
XPREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.8 nf=1 m=1
XPLOAD first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.8 nf=1 m=1

* Second gain stage and Miller compensation
XPOUT out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=83.3 L=0.8 nf=1 m=1
CCOMP first comp 1.2p
RNULL comp out 3k
.ends dut
