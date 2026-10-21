.subckt dut iref inp inn out
* Convert the reference current to a gate bias, then mirror it.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=7

* Differential pair and current-mirror load.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=125 L=0.85 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=125 L=0.85 nf=1 m=1
XPMREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=1.6 nf=1 m=1
XPMOUT out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=1.6 nf=1 m=1
.ends dut
