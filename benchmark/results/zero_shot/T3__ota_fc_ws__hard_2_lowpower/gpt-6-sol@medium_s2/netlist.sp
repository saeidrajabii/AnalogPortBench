.subckt dut iref inp inn out
* The reference current is received at the drain of a diode-connected
* NMOS and mirrored into the differential-pair tail and output sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINM left inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XINP gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XLOADD left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.8 nf=1 m=1
XLOADM gain left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.8 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XOUT out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.8 nf=1 m=1
RZ gain comp 3.9k
CC comp out 0.55p
.ends dut
