.subckt dut iref inp inn out
* Reference-current mirror and tail-current source
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=0.5 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=54 L=0.5 nf=1 m=1

* Bias for the NMOS cascodes
RBT vdd vbn 1Meg
RBB vbn iref 1.2Meg

* PMOS current reference
XNB pg iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=0.5 nf=1 m=1
XPB pg pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.6 nf=1 m=1

* NMOS differential pair and cascodes
XNI nl inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XNN nr inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XNCL ml vbn nl 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNCR out vbn nr 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Cascoded PMOS current-mirror load
XPTL pl pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.6 nf=1 m=1
XPTR pr pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.6 nf=1 m=1
XPCL ml ml pl vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.35 nf=1 m=1
XPCR out ml pr vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.35 nf=1 m=1
.ends dut
