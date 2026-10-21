.subckt dut iref inp inn out
* NMOS reference sink: the reference current enters the diode-connected drain/gate.
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* PMOS reference branch, biased by a mirrored NMOS sink.
XMNBIAS nbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* First stage: NMOS differential pair and PMOS current-mirror load.
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XM1 nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM2 nright inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP2 nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Second stage: NMOS common-source gain stage with PMOS current-source load.
XMOUT out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMPLOAD out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Miller compensation.
RZ nright ncomp 1k
CC ncomp out 2p
.ends dut
