.subckt dut iref inp inn out

* Reference mirror: 20 uA reference, 80 uA tail, 160 uA output.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=4
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=8

* NMOS differential input stage with PMOS mirror load.
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

XLOADREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XLOAD stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1

* Common-source output stage.
XOUTP out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1.2 nf=1 m=2

* Series-R Miller compensation.
RCOMP stage1 comp 400
CCOMP comp out 1p

.ends dut
