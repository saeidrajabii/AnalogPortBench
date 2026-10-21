.subckt dut iref inp inn out

* Reference mirror and bias generation.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.5 nf=1 m=1
XBN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Differential first stage with current-mirror load.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.5 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XLOAD1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XLOAD2 stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1

* Common-source output stage.
XOUTN out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1.5 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=140 L=1.5 nf=1 m=1

* Miller compensation with series zero-control resistor.
RCOMP stage1 comp 2.5k
CCOMP comp out 1.3p

.ends dut
