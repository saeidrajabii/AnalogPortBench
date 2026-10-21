.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generator.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1

* PMOS differential pair with NMOS current-mirror load.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.6 nf=1 m=1
XINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.6 nf=1 m=1
XLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* Common-source output stage.
XOUTN out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.7 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1

* Series-resistor Miller compensation.
RNULL stage1 comp 6k
CCOMP comp out 0.9p

* Candidate sizing; specification compliance requires model-based simulation.
.ends dut
