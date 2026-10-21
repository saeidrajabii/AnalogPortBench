.subckt dut iref inp inn out
* Reference current is converted to a gate bias, then mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.8 nf=1 m=1
XBP pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.8 nf=1 m=1
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.8 nf=1 m=1

* NMOS differential input stage with a PMOS mirror load.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XINP left inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XINN a inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XPL left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.8 nf=1 m=1
XPR a left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.8 nf=1 m=1

* Common-source output stage and Miller compensation.
XPO out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=84 L=0.8 nf=1 m=1
XNO out a 0 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=0.6 nf=1 m=1
RZ a cz 300
CC cz out 0.9p
.ends dut
