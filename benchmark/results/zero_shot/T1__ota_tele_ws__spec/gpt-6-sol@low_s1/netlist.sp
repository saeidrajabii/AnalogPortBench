.subckt dut iref inp inn out
* The 20 uA reference is sunk by a diode-connected NFET and mirrored
* into a PMOS bias generator; it does not feed a transistor source.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XNB pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* PMOS differential pair with an NMOS current-mirror load.
XPT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPI a inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.8 nf=1 m=1
XPN b inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.8 nf=1 m=1
XNL a a 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XNRL b a 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XPO out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XNO out b 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.7 nf=1 m=1
RZ b cz 1.5k
CC cz out 1.1p
.ends dut
