.subckt dut iref inp inn out

* Diode-connected reference and mirrored bias currents.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=6
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=30
XMNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=36

* Low-overdrive differential input pair.
XMNINM nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=15
XMNINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=15

* Long-channel active load.
XMPDIODE nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=6
XMPMIRROR nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=6

* Output-stage mirror ratio: 2.4 times one input branch.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=12

* Series-resistor Miller compensation.
RZERO nstage ncomp 2k
CCOMP ncomp out 2p

.ends dut
