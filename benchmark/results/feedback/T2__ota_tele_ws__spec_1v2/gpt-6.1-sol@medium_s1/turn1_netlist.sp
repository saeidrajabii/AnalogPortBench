* Two-stage OTA with mirrored bias and series-R Miller compensation.
* Device dimensions are in micrometres.
.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference, nominal 80 uA tail
* current and 100 uA second-stage sink current.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1
XMNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=1 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load.
* The input assignment gives positive gain from inp to out.
XMNINM nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XMNINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XMPDIODE nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1
XMPMIRROR nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1

* PMOS common-source output stage.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=0.6 nf=1 m=1

* Miller compensation with a series zero-setting resistor.
RZERO nstage ncomp 1.1k
CCOMP ncomp out 2.2p

.ends dut
