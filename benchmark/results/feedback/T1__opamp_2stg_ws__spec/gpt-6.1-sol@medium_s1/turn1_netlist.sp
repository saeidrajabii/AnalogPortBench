* SKY130 port candidate; specification compliance requires simulation
* with the testbench's TT device models.
.subckt dut iref inp inn out

* Reference-current sensing and mirrored bias currents.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.2 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.2 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=140 L=1.2 nf=1 m=1

* Differential input stage with PMOS current-mirror load.
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=28.8 L=1.2 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=28.8 L=1.2 nf=1 m=1
XPD nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XPM nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* Common-source output stage.
XOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1

* Miller compensation with series zero-control resistance.
RZERO nstage ncomp 1.2k
CCOMP ncomp out 650f

.ends dut
