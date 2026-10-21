.subckt dut iref inp inn out
* Reference current is converted to a gate bias before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.6 nf=1 m=1

* Input-stage tail current: nominally 16 uA.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.4 L=0.6 nf=1 m=1
XINN left inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.8 nf=1 m=1
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.8 nf=1 m=1
XPDI left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XPMI first left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1

* Generate and mirror the second-stage load current.
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.6 nf=1 m=1
XBIASP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.6 nf=1 m=1
XLOAD out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.6 nf=1 m=1
XGAIN out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.7 nf=1 m=1

* Miller compensation with a series nulling resistor.
RNULL first comp 300
CCOMP comp out 1p
.ends dut
