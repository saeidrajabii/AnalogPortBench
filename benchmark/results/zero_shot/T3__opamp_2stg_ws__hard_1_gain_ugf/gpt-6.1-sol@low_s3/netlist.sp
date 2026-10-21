.subckt dut iref inp inn out

* Reference-current mirror and bias distribution.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1

* NMOS differential input stage with PMOS mirror load.
XINP nfirst inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XLOADREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XLOAD nfirst nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1

* Common-source second stage.
XOUTP out nfirst vdd vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=2 nf=1 m=1

* Series-R Miller compensation.
RCOMP nfirst ncomp 1k
CCOMP ncomp out 650f

.ends dut
