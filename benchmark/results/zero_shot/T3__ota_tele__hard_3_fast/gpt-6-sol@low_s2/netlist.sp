.subckt dut iref inp inn out
* 20 uA reference is converted to a gate bias before being mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.6 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=0.5 nf=1 m=1

* Differential input stage and PMOS current-mirror load.
XINP d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.35 nf=1 m=1
XINN n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.35 nf=1 m=1
XPL d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.5 nf=1 m=1
XPR n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.5 nf=1 m=1

* Common-source output stage and Miller compensation.
XPO out d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30.8 L=0.5 nf=1 m=1
XNO out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.35 nf=1 m=1
RCOMP n1 nc 550
CCOMP nc out 0.45p
.ends dut
