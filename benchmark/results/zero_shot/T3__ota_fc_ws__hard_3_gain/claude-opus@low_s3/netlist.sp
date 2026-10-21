.subckt dut iref inp inn out
* bias mirror
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* input pair
XM1 x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 d inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS mirror load
XM3 d d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XM4 x d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* second stage
XM5 out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=8
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
* Miller compensation with nulling resistor
Rz x cz 1.5k
Cc cz out 1.2p
.ends dut
