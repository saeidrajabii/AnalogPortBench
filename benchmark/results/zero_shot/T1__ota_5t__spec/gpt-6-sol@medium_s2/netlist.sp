.subckt dut iref inp inn out
* The 20 uA reference is diode-connected and mirrored to the OTA tail.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=43.2 L=0.8 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP pdiode inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=0.8 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=0.8 nf=1 m=1
XPDIOD pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.0 nf=1 m=1
XPMIR out pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.0 nf=1 m=1
.ends dut
