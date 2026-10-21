.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=1.5 nf=1 m=1

* Cascode-bias generators.
XBPULL pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=1.5 nf=1 m=1
XPBD pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XPBF nbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XNBD nbias nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.6 L=2 nf=1 m=1

* NMOS differential pair and NMOS cascodes.
XIP nip inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XIM nim inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XNCOP nstage nbias nip 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNCOM nmirror nbias nim 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Wide-swing cascoded PMOS mirror load.
XPMREF pleft nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XPMOUT pright nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XPCREF nmirror pbias pleft vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XPCOUT nstage pbias pright vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Replica-biased second-stage current sink.
XPREPL obias nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XNREPL obias obias 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
CBIAS obias 0 10p

* Common-source output stage.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=220 L=0.8 nf=1 m=1
XNOUT out obias 0 0 sky130_fd_pr__nfet_01v8_lvt W=110 L=1.5 nf=1 m=1

* Series-resistor Miller compensation.
RZERO nstage ncomp 1k
CCOMP ncomp out 3p

.ends dut
