.subckt dut iref inp inn out
* The 20 uA reference is converted to a voltage before being mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=8

* NMOS differential pair with a PMOS current-mirror load.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.85 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.85 nf=1 m=1
XPMREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=1.2 nf=1 m=1
XPMOUT out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=1.2 nf=1 m=1
.ends dut
