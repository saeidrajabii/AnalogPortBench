.subckt dut iref inp inn out

* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=6 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=6 nf=1 m=5
XMNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=6 nf=1 m=11

* Long-channel differential pair.
XMNINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=270 L=4 nf=1 m=1
XMNINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=270 L=4 nf=1 m=1

* Asymmetric-length unity-ratio PMOS mirror.
XMPDIO nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6.67 L=1 nf=1 m=1
XMPLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20.01 L=3 nf=1 m=1

* Long-channel second stage.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=616 L=2.8 nf=1 m=1

* Miller compensation with phase-lead zero.
RCOMP nstage ncomp 2k
CCOMP ncomp out 1.15p

.ends dut
