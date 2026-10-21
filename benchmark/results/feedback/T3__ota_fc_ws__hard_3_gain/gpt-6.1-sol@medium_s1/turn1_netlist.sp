.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generation.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* PMOS differential input stage with NMOS mirror load.
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1 nf=1 m=1
XMPINN nmirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=2 nf=1 m=1
XMPINP ngain inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=2 nf=1 m=1
XMNLOAD1 nmirror nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=2 nf=1 m=1
XMNLOAD2 ngain nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=2 nf=1 m=1

* Common-source output stage.
XMNOUT out ngain 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1.5 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=255 L=1 nf=1 m=1

* Miller compensation with a series zero-setting resistor.
RZ ngain ncomp 2k
CC ncomp out 1.8p

.ends dut
