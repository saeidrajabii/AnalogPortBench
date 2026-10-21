.subckt dut iref inp inn out
* 20 uA reference; the operating currents are set by NMOS mirrors.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.2 L=1.5 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12.6 L=1.5 nf=1 m=1

* Differential first stage with a PMOS current-mirror load.
XIN1 left inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=1.5 nf=1 m=1
XIN2 gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=1.5 nf=1 m=1
XLOAD1 left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XLOAD2 gain left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1

* Common-source output stage and series-nulled Miller compensation.
XOUT out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=1.5 nf=1 m=1
RNULL gain comp 4k
CCOMP comp out 0.85p
.ends dut
