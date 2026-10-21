.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generation.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* PMOS differential pair with NMOS current-mirror load.
XPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XPINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XPINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XNLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1

* Common-source second stage.
XNOUT out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=1 nf=1 m=1
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=140 L=1 nf=1 m=1

* Series-R Miller compensation.
RCOMP stage1 comp 500
CCOMP comp out 1.5p

.ends dut
