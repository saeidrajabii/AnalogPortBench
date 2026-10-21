.subckt dut iref inp inn out
* bias diode
XB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
* tail 40uA
XT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=4
* input pair
XN1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=4
XN2 d2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=4
* mirror load (d2 is diode side so out of stage1 is d1)
XP2 d2 d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=4
XP1 d1 d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=4
* second stage
XP3 out d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=10
XN4 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=5
* compensation
RZ d1 nz 1.5k
CC nz out 0.6p
.ends dut
