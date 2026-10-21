.subckt dut iref inp inn out
* Reference current and NMOS bias mirrors.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=2 nf=1 m=1

* Differential stage. The input assignment gives negative feedback
* when out is connected to inn.
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XINP gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XPDI mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=3 nf=1 m=1
XPLOAD gain mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=3 nf=1 m=1

* Output stage and Miller compensation.
XPOUT out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=2 nf=1 m=1
RCOMP gain comp 6k
CCOMP comp out 390f
.ends dut
