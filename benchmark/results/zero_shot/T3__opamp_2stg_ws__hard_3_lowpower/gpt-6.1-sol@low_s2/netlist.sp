* Candidate port; performance requires verification with the supplied models.
.subckt dut iref inp inn out

* Diode-connected reference and mirrored bias currents.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XBIAS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=54 L=1.2 nf=1 m=1

* NMOS differential input stage with PMOS current-mirror load.
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1.2 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1.2 nf=1 m=1
XPD mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XPM stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1

* Common-source output stage.
XOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=1.2 nf=1 m=1

* Series-resistor Miller compensation.
RZ stage1 comp 1k
CC comp out 800f

.ends dut
