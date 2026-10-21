.subckt dut iref inp inn out

* Diode-connected reference and mirrored bias currents.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=2
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=5

* NMOS differential input stage.
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1

* PMOS current-mirror load.
* The shorter diode-connected device reduces mirror-node capacitance.
XPDIO nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.35 nf=1 m=1
XPLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1

* Common-source output stage.
XOUTP out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=0.5 nf=1 m=1

* Series-R Miller compensation.
RCOMP nstage ncomp 2k
CCOMP ncomp out 1p

.ends dut
