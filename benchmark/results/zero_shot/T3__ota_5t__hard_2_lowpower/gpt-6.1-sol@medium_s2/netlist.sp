.subckt dut iref inp inn out
* Reference-current mirror: nominal 10 uA tail from 20 uA reference.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1

* NMOS differential pair.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1

* PMOS current-mirror load.
XPREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XPOUT out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
.ends dut
