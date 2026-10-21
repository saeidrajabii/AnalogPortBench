.subckt dut iref inp inn out

* Reference-current mirror and bias sinks.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=3 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=72 L=3 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=3 nf=1 m=1

* Differential input stage with current-mirror load.
XINM nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=4 nf=1 m=1
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=4 nf=1 m=1
XLOAD1 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=4 nf=1 m=1
XLOAD2 nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=4 nf=1 m=1

* Common-source output stage.
XOUTP out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=1.5 nf=1 m=1

* Series-R Miller compensation.
RCOMP nstage ncomp 4k
CCOMP ncomp out 1.6p

.ends dut
