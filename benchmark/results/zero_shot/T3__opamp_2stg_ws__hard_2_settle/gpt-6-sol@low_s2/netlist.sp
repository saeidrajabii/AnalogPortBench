.subckt dut iref inp inn out
* Reference current is converted to a diode-connected NMOS bias,
* then mirrored; it does not enter a transistor source.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.2 nf=1 m=1
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.2 nf=1 m=1
XPR pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.2 nf=1 m=1

* Differential first stage with a PMOS current-mirror load.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=1.2 nf=1 m=1
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=1.5 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=1.5 nf=1 m=1
XPLD mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1.5 nf=1 m=1
XPLM first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1.5 nf=1 m=1

* Common-source output stage and Miller compensation.
XPO out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=128 L=1.2 nf=1 m=1
XNO out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=1.2 nf=1 m=1
RC first comp 400
CC comp out 650f
.ends dut
