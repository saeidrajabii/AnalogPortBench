.subckt dut iref inp inn out
* Diode-connected reference branch and mirrored amplifier bias.
XBREF1 nbias1 nbias1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XBREF2 iref iref nbias1 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* Differential input stage.
XTAIL ntail nbias1 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.8 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=140 L=0.8 nf=1 m=1
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=140 L=0.8 nf=1 m=1
XPLOAD1 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=3 nf=1 m=1
XPLOAD2 nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=3 nf=1 m=1

* Common-source output stage with a cascoded sink.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=220 L=1.8 nf=1 m=1
XNSINK1 nsink nbias1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XNSINK2 out iref nsink 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.8 nf=1 m=1

* Miller compensation and left-half-plane zero.
RZ nstage ncomp 2k
CC ncomp out 1.5p
.ends dut
