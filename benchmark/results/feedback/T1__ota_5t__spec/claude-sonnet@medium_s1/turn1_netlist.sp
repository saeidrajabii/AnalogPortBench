.subckt dut iref inp inn out
* bias: reference current into diode-connected NMOS, mirrored to the tail
XB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XT0 tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
* input pair (inp on the mirror-diode side, so out is non-inverting)
XN2 net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XN1 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS mirror load
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP0 out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
