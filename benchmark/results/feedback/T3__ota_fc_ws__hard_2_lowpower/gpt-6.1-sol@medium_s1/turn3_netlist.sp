.subckt dut iref inp inn out

* Reference current and low-overdrive bias mirrors.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=106.6667 L=4 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=106.6667 L=4 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=256 L=6 nf=1 m=1

* Differential input pair.
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=96 L=1.2 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=96 L=1.2 nf=1 m=1

* Low-overdrive current-mirror load.
XLOADREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1.2 nf=1 m=1
XLOAD stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1.2 nf=1 m=1

* Higher-transconductance output stage with reduced gate capacitance.
XOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=153.6 L=0.8 nf=1 m=1

* Miller compensation and phase-lead zero.
RCOMP stage1 comp 8.2k
CCOMP comp out 1p

.ends dut
