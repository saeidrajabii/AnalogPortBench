.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* Differential-pair tail: nominally 70 uA.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=1 nf=1 m=1

* NMOS differential input stage with PMOS mirror load.
XINM nmirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.6 nf=1 m=1
XINP nstage inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.6 nf=1 m=1
XPMREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XPMLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1

* Common-source output stage: nominally 140 uA.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=1 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=140 L=1 nf=1 m=1

* Miller compensation with a series zero-control resistor.
RCOMP nstage ncomp 680
CCOMP ncomp out 1.6p

.ends dut
