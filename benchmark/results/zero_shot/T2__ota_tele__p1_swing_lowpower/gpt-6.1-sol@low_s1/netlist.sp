.subckt dut iref inp inn out

* Reference-current mirror and bias sinks.
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XMO out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1.5 nf=1 m=1

* Differential input stage with current-mirror load.
XM1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.7 nf=1 m=1
XM2 ng inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.7 nf=1 m=1
XM3 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XM4 ng n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* Common-source output stage.
XM5 out ng vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=1 nf=1 m=1

* Miller compensation with series zero-nulling resistor.
RC ng nc 1k
CC nc out 1p

.ends dut
