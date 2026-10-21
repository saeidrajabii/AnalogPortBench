.subckt dut iref inp inn out

* Reference-current mirror and auxiliary PMOS bias.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XBN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Differential input stage with current-mirror load.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XINN diode inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XLOAD1 diode diode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XLOAD2 stage1 diode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* Common-source output stage.
XOUTP out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.8 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.2 nf=1 m=1

* Miller compensation with a series zero-control resistor.
RCOMP stage1 comp 1.5k
CCOMP comp out 1.8p

.ends dut
