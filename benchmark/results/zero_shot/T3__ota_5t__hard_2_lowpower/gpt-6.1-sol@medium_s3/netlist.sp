.subckt dut iref inp inn out

* Mirror the 20 uA reference into a nominal 10 uA tail current.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1

* NMOS differential input pair.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.8 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.8 nf=1 m=1

* PMOS current-mirror active load.
XPD mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XPO out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1

.ends dut
