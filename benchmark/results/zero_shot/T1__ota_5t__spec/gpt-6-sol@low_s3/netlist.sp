.subckt dut iref inp inn out
* Reference current is converted to a bias voltage, then mirrored to the OTA tail.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1.2 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1.2 nf=1 m=1
XLOAD_REF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.5 nf=1 m=1
XLOAD_OUT out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.5 nf=1 m=1
.ends dut
