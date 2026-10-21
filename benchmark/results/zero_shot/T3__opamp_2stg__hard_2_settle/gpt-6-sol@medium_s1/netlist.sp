.subckt dut iref inp inn out
* Mirror the 20 uA reference into the input-stage tail and output-stage sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=2 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=78 L=3 nf=1 m=1

* NMOS differential input stage with a PMOS mirror load.
XINM mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=65 L=2.6 nf=1 m=1
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=65 L=2.6 nf=1 m=1
XPM1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XPM2 first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1

* Common-source output stage and series Miller compensation.
XOUT out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=190 L=1.8 nf=1 m=1
RCOMP first comp 2k
CCOMP comp out 800f
.ends dut
