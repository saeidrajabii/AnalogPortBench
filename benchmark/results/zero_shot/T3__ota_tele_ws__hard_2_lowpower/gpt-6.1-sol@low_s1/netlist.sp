.subckt dut iref inp inn out
* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.5 nf=1 m=1
XMNBP pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.5 nf=1 m=1

* PMOS bias reference and mirrored current sources.
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1 nf=1 m=1

* PMOS differential input stage with NMOS mirror load.
XMPINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.75 nf=1 m=1
XMPINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.75 nf=1 m=1
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.5 nf=1 m=1
XMNLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.5 nf=1 m=1

* Common-source output stage.
XMNOUT out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=72 L=1.5 nf=1 m=1

* Series-resistor Miller compensation.
RZERO stage1 comp 2k
CCOMP comp out 1.1p
.ends dut
