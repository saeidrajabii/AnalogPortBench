.subckt dut iref inp inn out
* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1 nf=1 m=1

* PMOS differential input stage and NMOS mirror load.
XMPT tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1
XMPINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1
XMND mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNL stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* Common-source output stage.
XMNO out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=54 L=1 nf=1 m=1
XMPO out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=1 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP stage1 comp 3k
CCOMP comp out 750f
.ends dut
