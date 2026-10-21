.subckt dut iref inp inn out

* Reference-current mirror and bias branches
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2.5 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2.5 nf=1 m=1
XMNPB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2.5 nf=1 m=1
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=2.5 nf=1 m=1

* Differential input stage; input assignment gives non-inverting overall polarity
XMINN d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=5 nf=1 m=1
XMINP a inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=5 nf=1 m=1
XMPD d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=5 nf=1 m=1
XMPM a d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=5 nf=1 m=1

* Second gain stage
XMNOUT out a 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=5 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2.5 nf=1 m=1

* Miller compensation
RZ a ncomp 2k
CC ncomp out 0.9p

.ends dut
