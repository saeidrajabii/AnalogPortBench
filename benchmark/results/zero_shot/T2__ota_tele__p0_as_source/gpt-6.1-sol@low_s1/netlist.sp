.subckt dut iref inp inn out

* Reference-current mirror and differential-pair tail.
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=2

* Differential input stage with PMOS current-mirror load.
XM1 nmir inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM3 nmir nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XM4 n1 nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1

* Common-source output stage with mirrored current sink.
XM5 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=5

* Series-resistor Miller compensation.
RC n1 nc 1k
CC nc out 1p

.ends dut
