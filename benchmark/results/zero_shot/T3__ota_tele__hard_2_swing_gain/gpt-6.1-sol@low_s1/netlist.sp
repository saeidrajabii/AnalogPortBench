* Two-stage, Miller-compensated port.
* Candidate sizing; specification compliance requires simulation with
* the target model library and the specified testbench.
.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference, 20 uA tail,
* and nominal 30 uA output-stage sink.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XBIAS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=1.5 nf=1 m=1

* Differential input stage and PMOS mirror load.
* inp increasing pulls nstage down, increasing output pull-up current.
XINP nstage inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XINN nmirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XPD nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XPM nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1

* Common-source output stage.
XOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=1.2 nf=1 m=1

* Series-resistor Miller compensation.
RZ nstage ncomp 2.2k
CC ncomp out 1.2p

.ends dut
