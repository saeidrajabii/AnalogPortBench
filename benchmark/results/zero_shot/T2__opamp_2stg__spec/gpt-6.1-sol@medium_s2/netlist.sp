.subckt dut iref inp inn out

* Reference-current mirror and first-stage tail source
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=5

* NMOS differential pair
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1

* PMOS current-mirror active load
XPMREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.2 nf=1 m=1
XPMLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.2 nf=1 m=1

* Common-source output stage with mirrored current sink
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=5

* Series-RC Miller compensation
RCOMP nstage ncomp 1.2k
CCOMP ncomp out 1.5p

.ends dut
