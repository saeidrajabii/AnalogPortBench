.subckt dut iref inp inn out
* bias: diode-connected NMOS mirrors iref
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* tail current source (ratio 3)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=3
* input pair
XM2 net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=1
XM1 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=1
* PMOS mirror load
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP0 out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
