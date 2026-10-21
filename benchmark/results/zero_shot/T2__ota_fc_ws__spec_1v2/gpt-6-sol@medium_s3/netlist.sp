.subckt dut iref inp inn out
* Reference-current mirror: the 20 uA reference enters a diode-connected
* NMOS drain, not a transistor source.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=5
XPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XNBIAS pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* Differential input stage and PMOS current-mirror load.
XINP left inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.8 nf=1 m=1
XINN n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.8 nf=1 m=1
XPL left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XPR n1 left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1

* Common-source output stage and Miller compensation.
XPOUT out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=5
XNOUT out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.8 nf=1 m=1
RZ n1 nc 700
CC nc out 1.6p
RDC out n1 5Meg
.ends dut
