.subckt dut iref inp inn out
* bias: diode-connected NMOS mirror (20 units), tail uses 11 units
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=20
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=11
* input pair
XM1 net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=0.7 nf=1 m=1
XM2 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=0.7 nf=1 m=1
* PMOS mirror load
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.9 nf=1 m=1
XP2 out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.9 nf=1 m=1
.ends dut
