* Two-stage, Miller-compensated candidate.
* Numerical specifications require verification with the target models.
.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference, 10 uA bias branch.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* PMOS bias reference and mirrored amplifier currents.
XPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1.5 nf=1 m=1
XPT tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=420 L=1.5 nf=1 m=1
XPO out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=680 L=2 nf=1 m=1

* PMOS differential pair, nominally 14 uA per branch.
XPI nstage inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=3 nf=1 m=1
XPM nmirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=3 nf=1 m=1

* Long-channel NMOS mirror load.
XND nmirror nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=21 L=3 nf=1 m=1
XNL nstage nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=21 L=3 nf=1 m=1

* Inverting second stage, nominally 34 uA.
XNG out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=25.5 L=1.5 nf=1 m=1

* Series-resistor Miller compensation.
RZ nstage ncomp 5k
CC ncomp out 1.2p

.ends dut
