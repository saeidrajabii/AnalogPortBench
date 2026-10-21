.subckt dut iref inp inn out
* Reference-current mirror: the 20 uA reference enters a diode-connected drain.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XBTAIL tailbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=11 L=0.5 nf=1 m=2

* PMOS bias for the output-stage current source.
XBPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XBNREF pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XI1 nleft inp tailbias 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XI2 nfirst inn tailbias 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XL1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XL2 nfirst nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XO1 out nfirst 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XO2 out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
RCOMP nfirst ncomp 800
CCOMP ncomp out 0.65p
.ends dut
