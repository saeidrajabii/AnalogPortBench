.subckt dut iref inp inn out

* Reference current is mirrored into the amplifier.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=3.2
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=7.5

* Cascode biases with revised saturation margins.
RNC1 vdd bncas 160k
RNC2 bncas 0 1.04Meg
RPC1 vdd bpcas 770k
RPC2 bpcas 0 430k

* Differential input pair.
XINP ndp inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=1.2 nf=1 m=1
XINN ndn inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=1.2 nf=1 m=1

* Reduced-capacitance NMOS cascodes.
XNCOUT nstage bncas ndp 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.6 nf=1 m=1
XNCREF nmirror bncas ndn 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.6 nf=1 m=1

* Cascoded PMOS mirror.
XPLREF npref nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1 nf=1 m=1
XPLOUT npout nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1 nf=1 m=1
XPCREF nmirror bpcas npref vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.6 nf=1 m=1
XPCOUT nstage bpcas npout vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.6 nf=1 m=1

* Common-source output stage.
XOUTP out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=0.5 nf=1 m=1

* Lead-compensated Miller network.
RCOMP nstage ncomp 5.6k
CCOMP ncomp out 850f

.ends dut
