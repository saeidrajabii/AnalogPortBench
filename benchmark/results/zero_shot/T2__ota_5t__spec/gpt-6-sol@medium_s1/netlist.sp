.subckt dut iref inp inn out
* A diode-connected device converts the 20 uA reference current to a
* gate bias; the reference current does not enter a transistor source.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XBTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=0.5 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load.
XINP mirror inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XPREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1
XPOUT out mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1
.ends dut
