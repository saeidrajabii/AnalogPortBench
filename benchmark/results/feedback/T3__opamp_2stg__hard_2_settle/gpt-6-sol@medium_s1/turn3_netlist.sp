.subckt dut iref inp inn out
* The reference current enters a diode-connected device and is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=2 nf=1 m=1
XSINK sink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=2 nf=1 m=1

* Differential input stage and high-output-resistance mirror load.
XINM mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1 nf=1 m=1
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1 nf=1 m=1
XPM1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=4 nf=1 m=1
XPM2 first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=4 nf=1 m=1

* Common-source output stage with a cascoded current sink.
XOUT out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=280 L=3 nf=1 m=1
RBC1 vdd cbias 4.7Meg
RBC2 cbias 0 11Meg
XCAS out cbias sink 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

* Series Miller compensation.
RCOMP first comp 2.5k
CCOMP comp out 1.2p
.ends dut
