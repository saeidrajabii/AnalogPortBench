.subckt dut iref inp inn out
* Reference current is mirrored into the input-stage tail and output-stage sink.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=1 nf=1 m=1
XSINK out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=19 L=1 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINM pdi inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.6 nf=1 m=1
XINP gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.6 nf=1 m=1
XPD  pdi pdi vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XPL  gain pdi vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Second gain stage and series-null Miller compensation.
XOUT out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=54 L=1 nf=1 m=1
RZ gain comp 4k
CC comp out 1.5p
.ends dut
