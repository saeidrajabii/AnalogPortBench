.subckt dut iref inp inn out

* Reference-current mirror and bias-current sinks.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.5 nf=1 m=2.1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.5 nf=1 m=3.5

* Cascode gate biases.
RB1 vdd vbn 150k
RB2 vbn vbp 600k
RB3 vbp 0 450k
CBN vbn 0 2p
CBP vbp vdd 2p

* Differential input pair.
XINM ndm inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=26 L=2 nf=1 m=1
XINP ndp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=26 L=2 nf=1 m=1

* First-stage NMOS cascodes.
XCNM mirror vbn ndm 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XCNP stage1 vbn ndp 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* Cascoded PMOS current-mirror load.
XPMR psrc_m mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=37.5 L=1.5 nf=1 m=1
XPMO psrc_o mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=37.5 L=1.5 nf=1 m=1
XPCR mirror vbp psrc_m vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=1
XPCO stage1 vbp psrc_o vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=1

* Common-source output stage.
XOUTP out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=65 L=0.5 nf=1 m=1

* Lead-compensated Miller network.
RZ stage1 comp 6.8k
CC comp out 400f

.ends dut
