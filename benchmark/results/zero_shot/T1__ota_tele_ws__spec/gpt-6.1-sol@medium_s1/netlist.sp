.subckt dut iref inp inn out

* Reference-current receiver and mirrored tail current.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

* PMOS cascode bias: nominal 5-uA branch with resistive level shift.
XNBP pbcas iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
RBP pbtop pbcas 60k
XPBR pbtop pbtop vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=1.5 nf=1 m=1

* NMOS cascode bias, supplied by a mirrored reference current.
XPNB nbcas pbtop vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=1.5 nf=1 m=1
XNBU nbcas nbcas nbmid 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XNBL nbmid nbmid 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.8 L=1.2 nf=1 m=1

* Differential input pair.
XNI_P ndp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XNI_N ndn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1

* NMOS common-gate cascodes.
XNC_P mirror nbcas ndp 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XNC_N out nbcas ndn 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1

* Self-adjusting PMOS current-mirror load and wide-swing cascodes.
XPM_P psleft mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.6 nf=1 m=1
XPM_N psright mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.6 nf=1 m=1
XPC_P mirror pbcas psleft vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=1.5 nf=1 m=1
XPC_N out pbcas psright vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=1.5 nf=1 m=1

* Bias-node bypassing and output-pole adjustment.
CBN nbcas 0 2p
CBP pbcas vdd 2p
CO out 0 0.1p

.ends dut
