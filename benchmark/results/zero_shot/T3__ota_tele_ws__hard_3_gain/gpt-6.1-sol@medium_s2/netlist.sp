* Two-stage OTA with a cascoded first stage and Miller compensation.
* All transistor dimensions are in micrometres.
* Global supply nodes: vdd and 0.

.subckt dut iref inp inn out

* Reference-current sensing and mirroring.
* The reference enters the drain of a diode-connected NMOS.
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=1

* Nominal differential-pair tail current: 40 uA.
XNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=2

* Cascode gate biases: nominally 0.75 V and 0.50 V.
RBN1 vdd bncas 375k
RBN2 bncas 0 625k
RBP1 vdd bpcas 583.333k
RBP2 bpcas 0 416.667k

* NMOS differential pair.
* The second stage inverts, so inp drives the first-stage output branch.
XNINL ndl inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=1
XNINR ndr inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=1

* NMOS drain cascodes.
XNCL nmirror bncas ndl 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XNCR nstage bncas ndr 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* Cascoded PMOS current-mirror load.
XPMIRL pleft nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XPMIRR pright nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XPCL nmirror bpcas pleft vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XPCR nstage bpcas pright vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1

* PMOS common-source output stage.
* Nominal mirrored output-stage bias current: 120 uA.
XPGAIN out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=1.5 nf=1 m=1
XNLOAD out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=6

* Miller compensation with a series zero-control resistor.
RZERO nstage ncomp 1.2k
CCOMP ncomp out 2.2p

.ends dut
