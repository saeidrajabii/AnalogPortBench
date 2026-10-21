.subckt dut iref inp inn out
* bias: diode-connected NMOS mirror of the 20u reference
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* tail current source
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* input pair
XM2 net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=8 nf=1 m=4
XM1 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=8 nf=1 m=4
* PMOS mirror load
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=3 nf=1 m=1
XP0 out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=3 nf=1 m=1
.ends dut
