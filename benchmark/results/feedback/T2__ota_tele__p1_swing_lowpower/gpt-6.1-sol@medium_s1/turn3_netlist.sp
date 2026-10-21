.subckt dut iref inp inn out

* Reference-current mirror.
XBR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XBN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* PMOS bias mirror and current sources.
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=1.6 nf=1 m=1
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=480 L=1.6 nf=1 m=1
XLOAD out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=800 L=1.6 nf=1 m=1

* Differential input stage and current-mirror loads.
XIP nstage inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.6 nf=1 m=1
XIN nmirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.6 nf=1 m=1
XMD nmirror nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
XMM nstage nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1

* Common-source output stage.
XOUT out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=128 L=1.6 nf=1 m=1

* Revised Miller compensation and zero-control resistor.
CC nstage ncomp 1.4p
RZ ncomp out 2.2k

.ends dut
