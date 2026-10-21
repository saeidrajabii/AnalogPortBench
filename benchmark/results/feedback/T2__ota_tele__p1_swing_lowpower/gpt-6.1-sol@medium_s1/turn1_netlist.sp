.subckt dut iref inp inn out

* Reference-current mirror.
XBR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XBN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* PMOS bias mirror: nominal 30 uA input tail and 50 uA output load.
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=1 nf=1 m=1
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=1 nf=1 m=1
XLOAD out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=500 L=1 nf=1 m=1

* PMOS differential pair and NMOS current-mirror load.
* inp drives the high-impedance branch for overall non-inverting gain.
XIP nstage inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.6 nf=1 m=1
XIN nmirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.6 nf=1 m=1
XMD nmirror nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1
XMM nstage nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1

* Common-source output stage.
XOUT out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1

* Miller compensation with a series zero-control resistor.
CC nstage ncomp 1.6p
RZ ncomp out 1.5k

.ends dut
