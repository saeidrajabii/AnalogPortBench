.subckt dut iref inp inn out
* Reference current is converted to a gate bias, then mirrored into the tail.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.35 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.35 nf=1 m=1
XLOAD1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XLOAD2 out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=1
.ends dut
