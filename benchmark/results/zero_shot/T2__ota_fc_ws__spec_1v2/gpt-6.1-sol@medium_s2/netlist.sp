.subckt dut iref inp inn out

* Reference-current mirror and bias current sinks.
XMBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=1 nf=1 m=1
XMOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=1 nf=1 m=1

* Differential input stage with current-mirror load.
XMINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.6 nf=1 m=1
XMINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.6 nf=1 m=1
XMLOAD1 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.8 nf=1 m=1
XMLOAD2 nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.8 nf=1 m=1

* Common-source output stage.
XMOUTP out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=0.6 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP nstage ncomp 700
CCOMP ncomp out 2.2p

.ends dut
