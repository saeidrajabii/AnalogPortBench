.subckt dut iref inp inn out
* Reference current is converted to a voltage before it is mirrored.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Differential input stage and PMOS current-mirror load.
XNI1 nref inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XNI2 gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XPL1 nref nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=1.5 nf=1 m=1
XPL2 gain nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=1.5 nf=1 m=1

* Second stage and Miller compensation.
XPO out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=220 L=1.5 nf=1 m=1
XNO out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=1
RZ gain comp 1.5k
CC comp out 0.7p
.ends dut
