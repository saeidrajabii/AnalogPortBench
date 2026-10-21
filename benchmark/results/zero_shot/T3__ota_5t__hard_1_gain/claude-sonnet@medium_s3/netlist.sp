.subckt dut iref inp inn out
* bias: reference current is mirrored (diode-connected nfet)
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* tail current source (~12 uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
* input pair
XM1 n9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
XM2 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
* pfet mirror load
XP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=2 nf=1 m=1
XP2 out n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=2 nf=1 m=1
.ends dut
