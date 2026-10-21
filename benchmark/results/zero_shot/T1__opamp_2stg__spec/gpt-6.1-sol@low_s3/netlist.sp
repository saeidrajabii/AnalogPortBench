.subckt dut iref inp inn out
* Diode-connected reference and mirrored bias currents.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=2

* Differential input stage with PMOS current-mirror load.
XINP nstage inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XINN nmirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XPLREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XPLMIR nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1

* Common-source output stage.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=1.5 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=4

* Series-R Miller compensation.
RZERO nstage ncomp 1k
CCOMP ncomp out 650f
.ends dut
