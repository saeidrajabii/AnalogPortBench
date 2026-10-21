.subckt dut iref inp inn out

* Diode-connected reference and mirrored bias currents.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=6 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=6 nf=1 m=5
XMNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=63 L=6 nf=1 m=10

* Differential input stage.
XMNINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=267 L=4 nf=1 m=1
XMNINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=267 L=4 nf=1 m=1

* Unity-ratio PMOS mirror with a longer-channel output device.
XMPDIO nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMPLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=4 nf=1 m=1

* Common-source second stage.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=350 L=1.75 nf=1 m=1

* Series-R Miller compensation.
RCOMP nstage ncomp 3k
CCOMP ncomp out 900f

.ends dut
