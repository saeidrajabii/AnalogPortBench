.subckt dut iref inp inn out
* Reference-current mirror
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=2 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=175 L=8 nf=1 m=1

* Differential input stage
XINM mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1.2 nf=1 m=1
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1.2 nf=1 m=1

* Cascoded PMOS mirror load
RBIAS1 vdd pbias 14Meg
RBIAS2 pbias 0 10Meg
XPMD pmid pmid vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XPMC mirror pbias pmid vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1
XPMM pout pmid vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XPMO first pbias pout vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1

* Output stage with series Miller compensation
XOUT out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=3 nf=1 m=1
RCOMP first comp 2.5k
CCOMP comp out 1.5p
.ends dut
