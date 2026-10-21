.subckt dut iref inp inn out
* Diode-connected reference and 2:1 tail-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=2

* NMOS differential pair.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1

* PMOS current-mirror active load.
XPD mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.7 nf=1 m=1
XPO out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.7 nf=1 m=1
.ends dut
