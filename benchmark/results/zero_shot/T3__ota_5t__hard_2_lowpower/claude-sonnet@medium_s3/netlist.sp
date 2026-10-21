.subckt dut iref inp inn out
* bias: mirror 20uA down to ~10uA tail
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
* input pair (inp drives mirror side so gain is non-inverting)
XM2 n9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XM1 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.6 nf=1 m=1
* PMOS mirror load
XP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=1
XP0 out n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=1
.ends dut
