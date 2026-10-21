.subckt dut iref inp inn out

* Low-overdrive reference mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=80
XMNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=50

* Long-channel differential input pair.
XMNINM nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=25
XMNINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=25

* PMOS current-mirror load.
XMPDIODE nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=6
XMPMIRROR nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=6

* Common-source output stage.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.6 nf=1 m=6

* Series-R Miller compensation.
RZERO nstage ncomp 3k
CCOMP ncomp out 1.8p

.ends dut
