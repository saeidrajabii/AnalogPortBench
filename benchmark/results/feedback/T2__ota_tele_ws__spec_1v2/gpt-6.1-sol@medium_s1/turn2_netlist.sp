.subckt dut iref inp inn out

* Low-overdrive reference mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=2 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1600 L=2 nf=1 m=1
XMNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=2 nf=1 m=1

* Long-channel, low-overdrive differential input stage.
XMNINM nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=500 L=2 nf=1 m=1
XMNINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=500 L=2 nf=1 m=1

* Longer-channel PMOS mirror load.
XMPDIODE nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1.2 nf=1 m=1
XMPMIRROR nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1.2 nf=1 m=1

* Common-source output stage.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=0.6 nf=1 m=1

* Series-R Miller compensation.
RZERO nstage ncomp 3k
CCOMP ncomp out 1.8p

.ends dut
