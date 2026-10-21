.subckt dut iref inp inn out
* The reference current enters a diode-connected NMOS and is mirrored
* into the differential-pair tail and the second-stage current sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=1 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINN left inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XINP gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPDI left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XPMIR gain left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1

* Inverting PMOS output stage and series-RC Miller compensation.
XPOUT out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.7 nf=1 m=1
RNULL gain comp 1k
CCOMP comp out 1p
.ends dut
