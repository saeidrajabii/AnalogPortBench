.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference, 40 uA tail,
* and 100 uA second-stage sink.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1

* Differential input stage with PMOS current-mirror load.
XMNINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XMNINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XMPDIODE nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMPMIRROR nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* Inverting second stage.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1

* Miller compensation with a series zero-setting resistor.
RZERO nstage ncomp 3k
CCOMP ncomp out 1.2p

.ends dut
