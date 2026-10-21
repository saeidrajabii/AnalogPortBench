.subckt dut iref inp inn out
* The reference current enters a diode-connected device and is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1

* Differential input stage with a long-channel current-mirror load.
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=110 L=1.5 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=110 L=1.5 nf=1 m=1
XLOADREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=3 nf=1 m=1
XLOADOUT first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=3 nf=1 m=1

* Second gain stage and Miller compensation.
XGAIN out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=3 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=3 nf=1 m=1
RNULL first comp 5k
CCOMP comp out 1.2p
.ends dut
