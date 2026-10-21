.subckt dut iref inp inn out
* The reference current is converted to bias voltages by diode-connected
* transistors; the amplifier currents are supplied by mirrors.
XBREF1 nbias1 nbias1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XBREF2 iref iref nbias1 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* Differential input stage and PMOS current-mirror load.
XTAIL ntail nbias1 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=140 L=1.4 nf=1 m=1
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=140 L=1.4 nf=1 m=1
XPLOAD1 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=2.5 nf=1 m=1
XPLOAD2 nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=2.5 nf=1 m=1

* Output stage and cascoded current sink.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=220 L=1.2 nf=1 m=1
XNSINK1 nsink nbias1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XNSINK2 out iref nsink 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.8 nf=1 m=1

* Series-nulling-resistor Miller compensation.
RZ nstage ncomp 800
CC ncomp out 0.9p
.ends dut
