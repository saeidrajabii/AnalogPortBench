.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generation.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* Differential input stage and current-mirror load.
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=135 L=1.5 nf=1 m=1
XMPINN nmirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=600 L=2.5 nf=1 m=1
XMPINP ngain inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=600 L=2.5 nf=1 m=1
XMNLOAD1 nmirror nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=27 L=3 nf=1 m=1
XMNLOAD2 ngain nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=27 L=3 nf=1 m=1

* Common-source output stage.
XMNOUT out ngain 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=255 L=1 nf=1 m=1

* Series-resistor Miller compensation.
RZ ngain ncomp 2k
CC ncomp out 1.2p

.ends dut
