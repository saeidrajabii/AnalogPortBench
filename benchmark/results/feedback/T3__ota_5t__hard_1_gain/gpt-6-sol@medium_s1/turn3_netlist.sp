.subckt dut iref inp inn out
* Convert the reference current to NMOS and PMOS mirror biases.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.7 nf=1 m=1
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.7 nf=1 m=1
XBIASP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1.5 nf=1 m=1

* PMOS-input differential stage with an NMOS mirror load.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XP1 mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XP2 first inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XN1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XN2 first mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1

* Common-source output stage.
XNOUT out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Miller compensation.
RZ first comp 1k
CC comp out 0.28p
.ends dut
