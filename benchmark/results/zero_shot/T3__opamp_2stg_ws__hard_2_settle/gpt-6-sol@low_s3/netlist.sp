.subckt dut iref inp inn out
* The 20 uA reference is converted to a diode-connected NMOS bias
* and mirrored into the input-stage tail and output-stage sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=4
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=8

* Differential input stage with a PMOS current-mirror load.
XINP x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XINN d inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XPDIOD d d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XPMIR x d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=1

* Common-source output stage and Miller compensation.
XPOUT out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=4
RZ x cz 1.2k
CC cz out 550f
.ends dut
