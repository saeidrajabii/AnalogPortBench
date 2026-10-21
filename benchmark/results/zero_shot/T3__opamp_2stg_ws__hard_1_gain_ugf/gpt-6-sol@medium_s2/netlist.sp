.subckt dut iref inp inn out
* Reference-current mirror and PMOS bias
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.5 nf=1 m=1

* Cascode-gate bias divider
RB1 vdd bncas 49k
RB2 bncas bpcas 9k
RB3 bpcas 0 62k

* NMOS differential pair and tail-current mirror
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1
XINP fright inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XINN fleft inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Folded-cascode first stage; the left branch biases the NMOS mirror
XPTL fleft pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XPTR fright pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XPCL nleft bpcas fleft vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.5 nf=1 m=1
XPCR nstage bpcas fright vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.5 nf=1 m=1
XNCL nleft bncas nmirror 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNCR nstage bncas nright 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNML nmirror nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XNMR nright nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1

* Common-source output stage and Miller compensation
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=27.5 L=1 nf=1 m=1
RZ nstage ncomp 900
CC ncomp out 0.7p
.ends dut
