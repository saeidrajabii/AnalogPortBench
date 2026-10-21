.subckt dut iref inp inn out

* Reference and matched low-overdrive current mirrors.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=106.6667 L=4 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=106.6667 L=4 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=170.6667 L=4 nf=1 m=1

* Differential input stage.
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1

* Matched active load and second-stage device lengths.
XLOADREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XLOAD stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=128 L=2 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP stage1 comp 6k
CCOMP comp out 0.9p

.ends dut
