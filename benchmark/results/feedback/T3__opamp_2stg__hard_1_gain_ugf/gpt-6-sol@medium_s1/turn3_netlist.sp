.subckt dut iref inp inn out
* Convert the reference current to a gate bias, then mirror it.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1

* Output-sink cascode bias.
RBC vdd ncas 22k
XBC1 ncas ncas nlow 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XBC0 nlow iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1

* Differential first stage. Smaller mirror devices reduce the mirror-node
* capacitance that limited the preceding design's phase margin.
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=4
XINP nfirst inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=75 L=2 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=75 L=2 nf=1 m=1
XPM0 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XPM1 nfirst nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* Second stage with a cascoded current sink.
XOUTP out nfirst vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=2.5 nf=1 m=1
XOUTN nsink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1 nf=1 m=5
XOUTC out ncas nsink 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1 nf=1 m=5

RZ nfirst ncomp 1.2k
CC ncomp out 650f
.ends dut
