.subckt dut iref inp inn out

XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=1 nf=1 m=1

XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XPD nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24.5 L=0.7 nf=1 m=1
XPM nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24.5 L=0.7 nf=1 m=1

XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.7 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

RCOMP nstage ncomp 6.8k
CCOMP ncomp out 1.1p

.ends dut
