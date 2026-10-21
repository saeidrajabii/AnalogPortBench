.subckt dut iref inp inn out
* Reference current is converted to a gate bias, then mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1

* Differential input stage and PMOS current-mirror load.
XINP a inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XINN b inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XLOADB b b vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.7 nf=1 m=1
XLOADA a b vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.7 nf=1 m=1

* Second stage with series-RC Miller compensation.
XOUTP out a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.7 nf=1 m=1
RZ a comp 1.5k
CC comp out 1p
.ends dut
