.subckt dut iref inp inn out

* Reference-current mirror and tail bias
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=3

* PMOS output-current bias, derived from the mirrored reference
XMB2 pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMB3 pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Differential input stage with current-mirror load
XM1 nmirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2 nstage inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM3 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=1
XM4 nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=1

* Common-source output stage
XM5 out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XM6 out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=5

* Miller compensation with series zero-setting resistor
RCOMP nstage ncomp 1.5k
CCOMP ncomp out 1.3p

.ends dut
