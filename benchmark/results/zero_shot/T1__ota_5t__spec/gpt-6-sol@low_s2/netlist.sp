.subckt dut iref inp inn out
* The 20 uA reference biases a diode-connected NMOS; its gate voltage
* is mirrored to the OTA tail device.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XBTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Differential pair and PMOS current-mirror load.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XPOUT out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
.ends dut
