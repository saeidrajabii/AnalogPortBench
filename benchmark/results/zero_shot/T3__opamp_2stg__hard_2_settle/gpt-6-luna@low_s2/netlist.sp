.subckt dut iref inp inn out
* Reference-current sink and NMOS current mirrors
XMNREF nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMTAIL tailbias nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XMN2BIAS n2bias nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XMPBIAS_SINK pbias_sink nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* PMOS bias for the second-stage load
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPBIAS_FEED pbias vdd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XMTAIL1 tail tailbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XMNINP x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMNNIN y inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMPLOAD1 x x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPLOAD2 y x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Second gain stage and Miller compensation
XMNOUT out y 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=4
RZ y ncomp 1k
CC ncomp out 2p

* Reference-current branch; iref current is sunk through a diode-connected device
.ends dut
