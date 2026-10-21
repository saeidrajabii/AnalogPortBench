.subckt dut iref inp inn out
* Reference current enters a diode-connected NMOS and is mirrored
* into the input-stage tail and output-stage sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.5 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32.5 L=0.5 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINP x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.6 nf=1 m=1
XINN md inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.6 nf=1 m=1
XLOAD1 md md vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.8 nf=1 m=1
XLOAD2 x md vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.8 nf=1 m=1

* Common-source output stage and Miller compensation.
XOUT out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=0.6 nf=1 m=1
RZ x cz 1k
CC cz out 0.85p
.ends dut
