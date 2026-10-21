* Two-stage OTA with mirrored reference bias and Miller compensation.
* Candidate port; performance requires validation with the supplied models.
* Global supply: vdd = 1.2 V.

.subckt dut iref inp inn out

* Reference-current receiver and NMOS bias mirrors.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1

* NMOS differential input pair.
* Increasing inp lowers stage1, increasing the PMOS output current.
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

* PMOS current-mirror active load.
XPD mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XPM stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* Common-source output stage.
XOUTP out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP stage1 comp 1k
CCOMP comp out 1.5p

.ends dut
