.subckt dut iref inp inn out
* Reference-current mirror: the reference current enters a diode-connected
* NMOS drain, not a transistor source.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=2 nf=1 m=1

* NMOS differential input pair and PMOS current-mirror load.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XINN gain inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XPDI mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2 nf=1 m=1
XPLOAD gain mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XPOUT out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=96 L=2 nf=1 m=1
RCOMP gain comp 3.3k
CCOMP comp out 600f
.ends dut
