.subckt dut iref inp inn out

* Diode-connected reference and mirrored bias currents.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=4
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=6

* NMOS differential pair with PMOS current-mirror load.
XINM mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XPMREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XPMLOAD stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Common-source second stage.
XPOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP stage1 comp 680
CCOMP comp out 1p

.ends dut
