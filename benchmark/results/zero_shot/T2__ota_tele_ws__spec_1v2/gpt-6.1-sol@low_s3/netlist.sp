.subckt dut iref inp inn out
* Reference-current mirror: 20 uA reference, 40 uA input-stage bias,
* and 150 uA output-stage bias.
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMT ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XMO out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=1 nf=1 m=1

* Differential input stage with PMOS current-mirror load.
XMINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XMINP nfirst inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XMLP nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XMLM nfirst nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* Common-source output stage.
XMOUT out nfirst vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.6 nf=1 m=1

* Series-resistor Miller compensation.
RZ nfirst ncomp 700
CC ncomp out 1.2p
.ends dut
