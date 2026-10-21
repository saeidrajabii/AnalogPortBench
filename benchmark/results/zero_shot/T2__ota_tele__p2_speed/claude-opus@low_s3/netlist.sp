.subckt dut iref inp inn out
* bias
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
* first stage
XM1 x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XM2 d inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XM3 d d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4 x d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* second stage
XM6 out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=6
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=6
* Miller compensation with nulling resistor
Rz x cz 1.5k
Cc cz out 0.8p
.ends dut
