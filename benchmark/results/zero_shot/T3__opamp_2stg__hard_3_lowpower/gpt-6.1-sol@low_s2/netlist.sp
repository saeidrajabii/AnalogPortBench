.subckt dut iref inp inn out

* Diode-connected reference and mirrored bias currents.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=3 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=3 nf=1 m=2
XOUTBIAS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=3 nf=1 m=3

* NMOS differential input stage with PMOS mirror load.
XINP ndrive inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XLOADREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=3 nf=1 m=1
XLOAD ndrive nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=3 nf=1 m=1

* Common-source second stage.
XOUT out ndrive vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=2 nf=1 m=1

* Series-R Miller compensation.
RCOMP ndrive ncomp 3k
CCOMP ncomp out 550f

.ends dut
