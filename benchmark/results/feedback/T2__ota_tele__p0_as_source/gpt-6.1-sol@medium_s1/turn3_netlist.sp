.subckt dut iref inp inn out

* Low-overdrive reference mirror and tail-current source
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=4

* Output-stage bias derived from the mirrored reference
XMB2 pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1
XMB3 pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Differential input stage with increased low-common-mode headroom
XM1 nmirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.6 nf=1 m=1
XM2 nstage inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.6 nf=1 m=1
XM3 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XM4 nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1

* Common-source output stage with reduced gate capacitance
XM5 out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.8 nf=1 m=1
XM6 out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=1 nf=1 m=5

* Miller compensation with series zero-setting resistor
RCOMP nstage ncomp 1.5k
CCOMP ncomp out 1.9p

.ends dut
