.subckt dut iref inp inn out
* The reference current is converted to a voltage before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XPMD mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1.2 nf=1 m=1
XPMO first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1.2 nf=1 m=1

* Common-source output stage with series-RC Miller compensation.
XOUT out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.8 nf=1 m=1
RNULL first comp 350
CCOMP comp out 0.7p
.ends dut
