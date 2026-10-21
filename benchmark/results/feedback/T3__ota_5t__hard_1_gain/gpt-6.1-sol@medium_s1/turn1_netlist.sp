.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference, 14 uA input-stage tail.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=1 nf=1 m=1

* Differential input stage with PMOS current-mirror load.
* The first stage inverts; the second stage restores positive polarity.
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XPD nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24.5 L=0.7 nf=1 m=1
XPM nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24.5 L=0.7 nf=1 m=1

* Common-source output stage with a mirrored 20 uA sink.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.7 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP nstage ncomp 6.8k
CCOMP ncomp out 1.3p

.ends dut
