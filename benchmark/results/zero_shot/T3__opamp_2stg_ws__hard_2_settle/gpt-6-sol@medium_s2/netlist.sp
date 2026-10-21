.subckt dut iref inp inn out
* The reference current is converted to a gate bias before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1.5 nf=1 m=6
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1.5 nf=1 m=7

* NMOS differential pair with a PMOS current-mirror load.
XINM pmgate inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.2 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.2 nf=1 m=1
XLOAD1 pmgate pmgate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=1.5 nf=1 m=1
XLOAD2 stage1 pmgate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=1.5 nf=1 m=1

* Common-source output stage and Miller compensation.
XOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=1.5 nf=1 m=1
RNULL stage1 comp 1.5k
CCOMP comp out 650f
.ends dut
