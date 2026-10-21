.subckt dut iref inp inn out
* The 20 uA reference flows through diode-connected devices and is mirrored.
XBREF1 nbias1 nbias1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XBREF2 iref iref nbias1 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XTAIL ntail nbias1 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1.6 nf=1 m=1
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1.6 nf=1 m=1
XPLOAD1 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XPLOAD2 nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1

* Common-source output stage with a cascoded current sink.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1
XNSINK1 nsink nbias1 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.8 nf=1 m=1
XNSINK2 out iref nsink 0 sky130_fd_pr__nfet_01v8_lvt W=96 L=0.8 nf=1 m=1

* Miller compensation with a series nulling resistor.
RZ nstage ncomp 700
CC ncomp out 1.3p
.ends dut
