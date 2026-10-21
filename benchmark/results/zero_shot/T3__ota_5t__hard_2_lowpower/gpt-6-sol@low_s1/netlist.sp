.subckt dut iref inp inn out
* Reference current is converted to a gate bias by a diode-connected NMOS.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* Mirrored tail current for the differential pair.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XLOAD1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.7 nf=1 m=1
XLOAD2 out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.7 nf=1 m=1
.ends dut
