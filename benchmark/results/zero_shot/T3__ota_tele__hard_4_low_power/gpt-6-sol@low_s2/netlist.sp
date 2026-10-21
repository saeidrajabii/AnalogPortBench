.subckt dut iref inp inn out
* Reference current is received by a diode-connected NMOS and mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.2 L=0.7 nf=1 m=1
XBP pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.4 L=0.7 nf=1 m=1
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.8 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINP nmirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XINN nstage inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XPL nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.8 nf=1 m=1
XPR nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.8 nf=1 m=1

* Common-source output stage and Miller compensation.
XOUT out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XLOAD out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=13 L=0.8 nf=1 m=1
RZ nstage ncomp 5k
CC ncomp out 0.8p
.ends dut
