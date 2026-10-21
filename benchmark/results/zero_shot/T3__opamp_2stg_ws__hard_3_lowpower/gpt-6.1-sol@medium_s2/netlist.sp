.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference, 60 uA tail,
* and 85 uA nominal output-stage bias.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=3
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=42.5 L=1.5 nf=1 m=1

* Differential input stage and current-mirror active load.
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.6 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.6 nf=1 m=1
XLOAD1 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.3 nf=1 m=1
XLOAD2 nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.3 nf=1 m=1

* Common-source second stage.
XOUTP out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.7 nf=1 m=1

* Series-R Miller compensation.
RCOMP nstage ncomp 3k
CCOMP ncomp out 850f

.ends dut
