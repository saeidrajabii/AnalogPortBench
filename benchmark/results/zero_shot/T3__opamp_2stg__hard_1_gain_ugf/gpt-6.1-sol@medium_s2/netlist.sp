.subckt dut iref inp inn out

* Reference-current receiver and mirrored bias currents.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=4
XMNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=6

* NMOS differential input stage with PMOS mirror load.
XMNINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=72 L=2 nf=1 m=1
XMNINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=72 L=2 nf=1 m=1
XMPDIO nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XMPLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* Common-source output stage.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1 nf=1 m=1

* Series-R Miller compensation.
RCOMP nstage ncomp 1.2k
CCOMP ncomp out 1.2p

.ends dut
