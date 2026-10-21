* Two-stage OTA with mirrored reference bias and Miller compensation.
* Candidate sizing; specification compliance requires model-based simulation.
.global vdd

.subckt dut iref inp inn out

* Reference-current mirror: nominal 12 uA tail and 20 uA output sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.5 nf=1 m=1

* Differential input stage with PMOS current-mirror load.
* The first-stage output is inverted relative to inp.
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.8 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.8 nf=1 m=1
XPD mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XPM stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Inverting second stage restores the non-inverting inp-to-out polarity.
XPOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.2 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1

* Series-resistor Miller compensation.
RZ stage1 comp 4.7k
CC comp out 0.8p

.ends dut
