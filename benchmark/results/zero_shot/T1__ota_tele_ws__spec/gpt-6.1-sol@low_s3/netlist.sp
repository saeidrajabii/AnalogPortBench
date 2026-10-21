* SKY130 LVT single-stage cascoded OTA.
* Initial sizing; compliance requires verification with the supplied models.

.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference, nominal 100 uA tail.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=5

* Nominal 10 uA PMOS reference branch.
XNBREF pref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XPR pref pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Wide-swing cascode gate biases.
* Nominal nb = 1.05 V and pb = 0.85 V.
XPBN nb pref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
RBN nb 0 105k
RBP vdd pb 95k
XNBP pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* NMOS differential input pair.
* The inp branch drives the mirror; the inn branch drives out.
XNI1 nd1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XNI2 nd2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1

* NMOS output cascodes.
XNC1 mirror nb nd1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XNC2 out nb nd2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Cascoded PMOS current-mirror load.
XPL1 ps1 ps1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XPL2 ps2 ps1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XPC1 mirror pb ps1 vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XPC2 out pb ps2 vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1

.ends dut
