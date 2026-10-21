.subckt dut iref inp inn out
* Reference-current mirror and PMOS bias
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.7 nf=1 m=1
XNB pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.7 nf=1 m=1
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.6 nf=1 m=1

* PMOS differential input stage with NMOS mirror load
XPT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.6 nf=1 m=1
XP1 n1 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XP2 n2 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XN1 n1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.8 nf=1 m=1
XN2 n2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.8 nf=1 m=1

* Common-source output stage and Miller compensation
XPO out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XNO out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.7 nf=1 m=1
RZ n2 nc 900
CC nc out 1.1p
.ends dut
