.subckt dut iref inp inn out
* The reference current enters a diode-connected NMOS before being mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.5 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XPLOAD1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XPLOAD2 stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* Common-source output stage and series-null Miller compensation.
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=84 L=1.5 nf=1 m=1
XNOUT out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
RNULL stage1 comp 1.5k
CCOMP comp out 2.2p
.ends dut
