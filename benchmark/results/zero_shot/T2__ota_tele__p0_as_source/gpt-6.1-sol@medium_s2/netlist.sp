.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference, nominal 70 uA tail.
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=210 L=1 nf=1 m=1

* Differential input stage with PMOS current-mirror load.
* Input orientation accounts for the inverting second stage.
XM1 nmir inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1 nf=1 m=1
XM2 nstage inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1 nf=1 m=1
XM3 nmir nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM4 nstage nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Common-source output stage with nominal 110 uA mirrored sink.
XM5 out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=0.6 nf=1 m=1
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=330 L=1 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP nstage ncomp 1k
CCOMP ncomp out 2p

.ends dut
