.subckt dut iref inp inn out

* Diode-connected reference and mirrored bias currents.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=5
XMNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=10

* NMOS differential input stage with PMOS current-mirror load.
XMNINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=1
XMNINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=1
XMPDIO nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMPLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* Inverting second stage.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=140 L=0.7 nf=1 m=1

* Series-R Miller compensation.
RCOMP nstage ncomp 900
CCOMP ncomp out 1.7p

.ends dut
