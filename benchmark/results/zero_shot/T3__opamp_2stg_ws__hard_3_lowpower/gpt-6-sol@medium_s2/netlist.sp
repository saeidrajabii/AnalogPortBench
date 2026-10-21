.subckt dut iref inp inn out
* The reference current is converted to a gate bias, then mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP left inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1
XINN gain inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1
XPL left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2.5 nf=1 m=1
XPR gain left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2.5 nf=1 m=1

* Second gain stage and cascoded output-current sink.
XPOUT out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=145 L=0.7 nf=1 m=1
XNOUT sink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XNCAS out cas sink 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.6 nf=1 m=1
RCAS1 vdd cas 370k
RCAS2 cas 0 830k
CCAS cas 0 3p

* Miller compensation with a series nulling resistor.
RZ gain comp 1.5k
CC comp out 0.46p
.ends dut
