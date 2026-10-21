.subckt dut iref inp inn out
* bias: diode-connected mirror input
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* tail current source
XM0 tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* input pair
XM1 n9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XM2 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
* PMOS mirror load
XP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XP0 out n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
.ends dut
