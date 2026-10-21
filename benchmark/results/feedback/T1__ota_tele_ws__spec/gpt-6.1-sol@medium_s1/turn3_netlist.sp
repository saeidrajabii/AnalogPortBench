.subckt dut iref inp inn out

* Reference-current receiver and nominal 80-uA tail mirror.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1

* PMOS wide-swing cascode bias.
XNBP pbcas iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
RBP pbtop pbcas 56k
XPBR pbtop pbtop vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=1.5 nf=1 m=1

* Mirrored NMOS cascode-bias branch.
XPNB nbcas pbtop vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5.25 L=1.5 nf=1 m=1
XNBU nbcas nbcas nbmid 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XNBL nbmid nbmid 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.8 L=1.2 nf=1 m=1

* Long-channel differential input pair.
XNI_P ndp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=67.2 L=2.1 nf=1 m=1
XNI_N ndn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=67.2 L=2.1 nf=1 m=1

* NMOS common-gate cascodes.
XNC_P mirror nbcas ndp 0 sky130_fd_pr__nfet_01v8_lvt W=128 L=2 nf=1 m=1
XNC_N out nbcas ndn 0 sky130_fd_pr__nfet_01v8_lvt W=128 L=2 nf=1 m=1

* Long-channel PMOS current-mirror load.
XPM_P psleft mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=112 L=1.05 nf=1 m=1
XPM_N psright mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=112 L=1.05 nf=1 m=1

* PMOS wide-swing cascodes.
XPC_P mirror pbcas psleft vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1
XPC_N out pbcas psright vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1

* Bias bypassing and dominant-pole adjustment.
CBN nbcas 0 2p
CBP pbcas vdd 2p
CO out 0 0.7p

.ends dut
