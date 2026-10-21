.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generator.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.8 L=1 nf=1 m=1
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1

* PMOS differential input stage with NMOS current-mirror load.
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XMPINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XMPINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* Common-source output stage.
XMNOUT out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.8 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1 nf=1 m=1

* Miller compensation with a series zero-control resistor.
CCOMP stage1 comp 1p
RCOMP comp out 3.3k

.ends dut
