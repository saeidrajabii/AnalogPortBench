.subckt dut iref inp inn out
* The 20 uA reference is diode-connected, then mirrored into the OTA tail.
XBIAS iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.7 nf=1 m=1

* Differential pair with a PMOS current-mirror load.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.7 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.7 nf=1 m=1
XPDI mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.7 nf=1 m=1
XPMIR out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.7 nf=1 m=1
.ends dut
