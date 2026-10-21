.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* Differential-stage tail: nominally 120 uA.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=6

* NMOS differential pair with PMOS current-mirror load.
XINM mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

XLOAD1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.6 nf=1 m=1
XLOAD2 stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.6 nf=1 m=1

* Common-source output stage: nominally 200 uA.
XOUTP out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=1 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=10

* Series-R Miller compensation.
RCOMP stage1 comp 2k
CCOMP comp out 1.1p

.ends dut
