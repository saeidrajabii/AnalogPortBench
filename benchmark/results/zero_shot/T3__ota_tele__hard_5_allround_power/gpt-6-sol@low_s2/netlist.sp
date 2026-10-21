.subckt dut iref inp inn out
* The 20 uA reference current is mirrored into the bias branches.
XBN iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XBT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XBP pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=1 nf=1 m=1
XPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1

* Differential first stage.
XN1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XN2 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XP2 n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Common-source output stage and series Miller compensation.
XP3 out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XN3 out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1.5 nf=1 m=1
RZ n1 nc 1.5k
CC nc out 0.75p
.ends dut
