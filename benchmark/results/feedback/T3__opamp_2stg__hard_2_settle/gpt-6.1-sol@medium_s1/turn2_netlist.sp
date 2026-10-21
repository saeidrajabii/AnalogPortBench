.subckt dut iref inp inn out

* Diode-connected reference and mirrored bias currents.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=3.2
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=7.5

* Cascode gate biases; each divider draws 1 uA.
RNC1 vdd bncas 120k
RNC2 bncas 0 1.08Meg
RPC1 vdd bpcas 650k
RPC2 bpcas 0 550k

* NMOS differential pair.
XINP ndp inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=1.2 nf=1 m=1
XINN ndn inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=1.2 nf=1 m=1

* NMOS cascodes.
XNCOUT nstage bncas ndp 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.6 nf=1 m=1
XNCREF nmirror bncas ndn 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.6 nf=1 m=1

* Cascoded PMOS current-mirror load.
XPLREF npref nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1 nf=1 m=1
XPLOUT npout nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1 nf=1 m=1
XPCREF nmirror bpcas npref vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=0.6 nf=1 m=1
XPCOUT nstage bpcas npout vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=0.6 nf=1 m=1

* Common-source second stage.
XOUTP out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=0.5 nf=1 m=1

* Miller compensation with a series zero-setting resistor.
RCOMP nstage ncomp 2.7k
CCOMP ncomp out 650f

.ends dut
