.subckt dut iref inp inn out

* Reference-current mirror; iref connects only to drain and gate.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* Differential input stage.
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=2.5
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1

* PMOS current-mirror load.
XLOADREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1

* Common-source output stage with mirrored current sink.
XOUTP out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=0.5 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=7.5

* Series-RC Miller compensation.
RCOMP nstage ncomp 1.5k
CCOMP ncomp out 600f

.ends dut
