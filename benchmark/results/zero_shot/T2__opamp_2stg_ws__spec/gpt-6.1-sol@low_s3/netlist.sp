.subckt dut iref inp inn out
* Diode-connected reference and mirrored bias currents.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1.5 nf=1 m=1
XBIAS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=1.5 nf=1 m=1

* Differential input stage with PMOS current-mirror load.
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=1
XPMREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XPMLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1

* Common-source output stage.
XOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=1.5 nf=1 m=1

* Series-R Miller compensation.
RZ nstage ncomp 1.2k
CC ncomp out 1.35p
.ends dut
