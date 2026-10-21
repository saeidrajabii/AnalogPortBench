.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference, 20 uA tail,
* and nominally 80 uA second-stage sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=4

* Low-current cascode-bias divider.
* Nominal biases: bncas = 0.96 V, bpcas = 0.50 V.
RB1 vdd bncas 24k
RB2 bncas bpcas 46k
RB3 bpcas 0 50k

* NMOS differential input pair.
XINP ndp inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XINN ndn inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1

* Input-branch cascodes.
XNC1 nstage bncas ndp 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.6 nf=1 m=1
XNC2 nmirror bncas ndn 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.6 nf=1 m=1

* Low-voltage cascoded PMOS mirror load.
XPL1 npl nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=0.5 nf=1 m=1
XPL2 npr nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=0.5 nf=1 m=1
XPC1 nmirror bpcas npl vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=0.5 nf=1 m=1
XPC2 nstage bpcas npr vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=0.5 nf=1 m=1

* Common-source output stage.
XOUTP out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=0.5 nf=1 m=8

* Series-R Miller compensation.
RCOMP nstage ncomp 2k
CCOMP ncomp out 500f

.ends dut
