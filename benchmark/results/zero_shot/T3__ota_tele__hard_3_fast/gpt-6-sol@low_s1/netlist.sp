.subckt dut iref inp inn out
* NMOS reference mirror: 20 uA reference, 28 uA input-pair tail.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8.4 L=0.5 nf=1 m=1

* PMOS bias reference, supplied by a 12 uA NMOS mirror branch.
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.6 L=0.5 nf=1 m=1
XPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XN1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.35 nf=1 m=1
XN2 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.35 nf=1 m=1
XP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP2 n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Common-source output stage and Miller compensation.
XNO out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.35 nf=1 m=1
XPO out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
RC n1 nc 1k
CC nc out 0.4p
.ends dut
