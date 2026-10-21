* Candidate port; performance requires verification with the supplied
* SKY130 models and testbench. Specifications are not verified here.
.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generation.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* PMOS differential input stage, nominal 40 uA tail current.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* Common-source output stage, nominal 50 uA bias.
XOUTN out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP stage1 comp 800
CCOMP comp out 0.9p

.ends dut
