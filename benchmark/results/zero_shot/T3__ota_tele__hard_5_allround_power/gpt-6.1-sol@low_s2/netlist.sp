.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generation.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* PMOS differential input stage with NMOS mirror load.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* Common-source second stage.
XOUTN out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.7 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=96 L=1 nf=1 m=1

* Miller compensation with a series zero-control resistor.
RZERO stage1 comp 1.5k
CCOMP comp out 1.1p

.ends dut
