.subckt dut iref inp inn out
* Reference current is received by a diode-connected NMOS and mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=56 L=3 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=3 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=2 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=2 nf=1 m=1
XPDI mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2 nf=1 m=1
XPMIR first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XPOUT out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
RZ first comp 1.3k
CC comp out 550f
.ends dut
