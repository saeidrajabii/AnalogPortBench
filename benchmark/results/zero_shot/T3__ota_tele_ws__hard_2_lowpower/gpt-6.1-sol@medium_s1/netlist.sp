.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1

* Differential-stage tail: nominally 28 uA.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=84 L=2 nf=1 m=1

* NMOS differential input pair.
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.2 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.2 nf=1 m=1

* PMOS current-mirror load.
XLOAD1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XLOAD2 stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1

* Common-source output stage with mirrored 38 uA sink.
XOUTP out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.8 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=114 L=2 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP stage1 comp 5.6k
CCOMP comp out 1.2p

.ends dut
