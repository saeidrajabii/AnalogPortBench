.subckt dut iref inp inn out
* Reference current is received by a diode-connected NMOS and mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.8 nf=1 m=1

* First stage: NMOS differential pair with a PMOS current-mirror load.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=0.8 nf=1 m=1
XINP nmir inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XINN nfirst inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XPMD nmir nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=0.8 nf=1 m=1
XPMM nfirst nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=0.8 nf=1 m=1

* Second stage and Miller compensation.
XOUT out nfirst vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=0.8 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=54 L=1.5 nf=1 m=1
RZ nfirst ncomp 650
CC ncomp out 1p
.ends dut
