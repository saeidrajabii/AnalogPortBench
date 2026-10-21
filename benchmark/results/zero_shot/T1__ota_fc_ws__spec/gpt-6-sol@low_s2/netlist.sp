.subckt dut iref inp inn out
* The reference current is converted to a voltage before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1

* PMOS-input differential stage with an NMOS current-mirror load.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.7 nf=1 m=1
XINP stage inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=0.5 nf=1 m=1
XINN diode inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=0.5 nf=1 m=1
XLOAD1 diode diode 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.7 nf=1 m=1
XLOAD2 stage diode 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.7 nf=1 m=1

* Common-source output stage and Miller compensation.
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.7 nf=1 m=1
XNOUT out stage 0 0 sky130_fd_pr__nfet_01v8_lvt W=37 L=0.7 nf=1 m=1
RZ stage comp 600
CC comp out 1p
.ends dut
