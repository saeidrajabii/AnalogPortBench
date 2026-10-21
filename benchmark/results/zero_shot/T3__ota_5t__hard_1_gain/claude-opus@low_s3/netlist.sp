.subckt dut iref inp inn out
* Bias: the reference current enters a diode-connected NMOS and is mirrored 1:1 into the tail
XB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XT0 tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* Input pair: long channel for low gds, wide for high gm/Id
XN1 net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XN2 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
* PMOS current-mirror load
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1
XP0 out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1
.ends dut
