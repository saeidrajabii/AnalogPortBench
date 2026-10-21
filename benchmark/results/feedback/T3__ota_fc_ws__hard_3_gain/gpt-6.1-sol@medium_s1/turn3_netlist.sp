.subckt dut iref inp inn out

* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1

* Low-overdrive tail source and differential input pair.
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=1 nf=1 m=1
XMPINN nmirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=2 nf=1 m=1
XMPINP ngain inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=2 nf=1 m=1

* First-stage current-mirror load.
XMNLOAD1 nmirror nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2.5 nf=1 m=1
XMNLOAD2 ngain nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2.5 nf=1 m=1

* Long-channel common-source output stage.
XMNOUT out ngain 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=3 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=900 L=1.5 nf=1 m=1

* Miller compensation and phase-lead zero.
RZ ngain ncomp 3.5k
CC ncomp out 1.1p

.ends dut
