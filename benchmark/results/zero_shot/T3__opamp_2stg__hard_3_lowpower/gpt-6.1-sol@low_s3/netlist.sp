* SKY130 LVT two-stage amplifier.
* Candidate sizing; specification compliance requires model-based verification.

.subckt dut iref inp inn out

* Reference current is received at a diode-connected drain.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Differential-stage tail current: nominally 40 uA.
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=2

* NMOS differential pair.
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=1.5 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=1.5 nf=1 m=1

* PMOS current-mirror load.
XLOADREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1
XLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1

* Common-source output stage with nominal 60 uA current sink.
XOUTP out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=1 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=3

* Miller compensation and zero-control resistor.
RZERO nstage ncomp 1.5k
CCOMP ncomp out 850f

.ends dut
