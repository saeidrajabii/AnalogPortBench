.subckt dut iref inp inn out
* Reference current flows through a diode-connected NMOS and is mirrored
* into the differential-pair tail and the second-stage current sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=2
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=4

* NMOS differential pair with a PMOS current-mirror load.
XINP gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.7 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.7 nf=1 m=1
XPDI mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=1.2 nf=1 m=1
XPLOAD gain mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=1.2 nf=1 m=1

* Common-source output stage and series Miller compensation.
XPOUT out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=1.2 nf=1 m=4
RCOMP gain comp 1.2k
CCOMP comp out 520f
.ends dut
