.subckt dut iref inp inn out
* Diode-connected reference and 1.2:1 mirrored tail current.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=96 L=1 nf=1 m=1

* Long-channel differential pair.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=3 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=3 nf=1 m=1

* PMOS current-mirror load.
XPD mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=3 nf=1 m=1
XPO out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=3 nf=1 m=1
.ends dut
