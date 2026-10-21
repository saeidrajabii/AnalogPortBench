.subckt dut iref inp inn out

* Reference-current mirror; reference current enters a drain.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=1.5 nf=1 m=1

* Differential-pair tail current.
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=1.5 nf=1 m=3

* NMOS differential input pair.
XMNINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XMNINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1

* PMOS current-mirror active load.
XMPDIO nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=1.2 nf=1 m=1
XMPLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=1.2 nf=1 m=1

* Common-source second stage and mirrored current sink.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=1.5 nf=1 m=6

* Series-resistor Miller compensation.
RCOMP nstage ncomp 4k
CCOMP ncomp out 750f

.ends dut
