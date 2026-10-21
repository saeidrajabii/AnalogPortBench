.subckt dut iref inp inn out

* Reference-current receiver and reduced-current bias mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=2 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1

* PMOS differential pair with NMOS current-mirror load.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.2 nf=1 m=1
XLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.2 nf=1 m=1

* Common-source output stage.
XOUTN out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP stage1 comp 8.2k
CCOMP comp out 0.30p

.ends dut
