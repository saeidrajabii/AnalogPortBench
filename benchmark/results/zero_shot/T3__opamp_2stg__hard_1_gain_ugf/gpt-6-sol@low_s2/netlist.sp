.subckt dut iref inp inn out
* The 20 uA reference flows through a diode-connected NMOS and is mirrored
* into the input-stage tail source and output-stage current sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=2 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=2 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XPDI mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=1
XPLOAD first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=1

* Common-source output stage and Miller compensation.
XPOUT out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=1.5 nf=1 m=1
RNULL first comp 1.4k
CCOMP comp out 650f
.ends dut
