.subckt dut iref inp inn out
* The 20 uA reference is diode-connected and mirrored into the OTA tail.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=55 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=29.5 L=1 nf=1 m=1

* Differential pair with a PMOS current-mirror load.
XINP nmirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=0.8 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=0.8 nf=1 m=1
XLOADREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.2 nf=1 m=1
XLOADOUT out nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1.2 nf=1 m=1
.ends dut
