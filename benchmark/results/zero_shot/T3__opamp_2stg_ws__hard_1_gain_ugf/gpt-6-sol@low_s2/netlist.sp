.subckt dut iref inp inn out
* Reference current is converted to a gate bias before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=5
XBPULL pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XPMD mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1
XPMM first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1

* Second-stage current source and common-source amplifier.
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=6
XNOUT out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.7 nf=1 m=1

* Series-null resistor and Miller compensation capacitor.
RZ first comp 500
CC comp out 600f
.ends dut
