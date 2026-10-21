.subckt dut iref inp inn out

* Reference sensing and mirrored operating currents.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.2 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.2 nf=1 m=1
XSINK nsink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=140 L=1.2 nf=1 m=1

* Cascode-bias generator: two mirrored 10-uA branches.
XBP_SINK vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=1
XBP1 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XBP2 vbpc vbpc vbp vdd sky130_fd_pr__pfet_01v8_lvt W=7.14 L=0.35 nf=1 m=1

XBN_FEED vbnc vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XBN1 vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=1
XBN2 vbnc vbnc vbn 0 sky130_fd_pr__nfet_01v8_lvt W=7.14 L=0.3 nf=1 m=1

* Differential input stage.
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=28.8 L=1.2 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=28.8 L=1.2 nf=1 m=1
XPD nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XPM nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* Cascoded common-source output stage.
XOUT ndrive nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XPCAS out vbpc ndrive vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.35 nf=1 m=1
XNCAS out vbnc nsink 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.3 nf=1 m=1

* Series-resistor Miller compensation.
RZERO nstage ncomp 1.2k
CCOMP ncomp out 620f

.ends dut
