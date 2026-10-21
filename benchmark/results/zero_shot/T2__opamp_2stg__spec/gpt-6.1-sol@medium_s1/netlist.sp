.subckt dut iref inp inn out

* Reference current is received by a diode-connected NMOS.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* Mirrored differential-pair tail current: nominally 60 uA.
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=3

* NMOS differential input pair.
XMNINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XMNINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1

* PMOS current-mirror active load.
XMPDIODE nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.2 nf=1 m=1
XMPMIRROR nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.2 nf=1 m=1

* Common-source second stage.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=0.8 nf=1 m=1

* Mirrored output-stage sink current: nominally 140 uA.
XMNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=7

* Miller compensation with a series zero-setting resistor.
RCOMP nstage ncomp 1.5k
CCOMP ncomp out 900f

.ends dut
