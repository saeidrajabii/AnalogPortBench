.subckt dut iref inp inn out
* Reference-current sink and mirrored bias current
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XMNSINK vbpm iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1

* PMOS current-reference diode and branch current sources
XMPREF vbpm vbpm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XMPLEFT pleft vbpm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XMPRIGHT pright vbpm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* Tail current mirror
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=1.5 nf=1 m=1

* Cascode gate bias dividers
RNCAS1 vdd vbncas 500k
RNCAS2 vbncas 0 1Meg
RPCAS1 vdd vbpcas 500k
RPCAS2 vbpcas 0 1Meg

* Differential input pair; output is taken from the inn branch
XMINP nin inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMINN ninn inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* NMOS cascodes
XMNCASL out vbncas nin 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XMNCASR nout2 vbncas ninn 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* PMOS cascodes and loads
XMPCASL out vbpcas pleft vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XMPCASR nout2 vbpcas pright vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
.ends dut
