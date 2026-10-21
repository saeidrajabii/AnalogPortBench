.subckt dut iref inp inn out
* The reference current is converted to a voltage before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Resistive cascode-gate bias
RBT vcn vdd 500k
RBB vcn 0 700k

* Differential input pair and NMOS cascodes
XINP x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.8 nf=1 m=1
XINN x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.8 nf=1 m=1
XNC1 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XNC2 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* PMOS current-mirror load
XPL1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=2 nf=1 m=1
XPL2 out d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=2 nf=1 m=1
.ends dut
