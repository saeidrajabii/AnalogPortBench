.subckt dut iref inp inn out
* The reference current is received by a diode-connected NMOS and mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XLOAD out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=21 L=1.5 nf=1 m=1

* NMOS differential input pair and PMOS current-mirror load.
XINP mir inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=19 L=1.5 nf=1 m=1
XINN gain inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=19 L=1.5 nf=1 m=1
XMIR mir mir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1.5 nf=1 m=1
XACT gain mir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1.5 nf=1 m=1

* Common-source output stage with series-RC Miller compensation.
XOUT out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=190 L=1.2 nf=1 m=1
RZ gain comp 2k
CC comp out 600f
.ends dut
