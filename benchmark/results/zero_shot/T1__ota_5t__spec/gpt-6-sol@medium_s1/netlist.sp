.subckt dut iref inp inn out
* A diode-connected NMOS mirrors the 20 uA reference into the OTA tail.
XNB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Differential pair and PMOS current-mirror load.
XNI mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=52 L=1 nf=1 m=1
XNN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=52 L=1 nf=1 m=1
XPMI mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1.2 nf=1 m=1
XPMO out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1.2 nf=1 m=1
.ends dut
