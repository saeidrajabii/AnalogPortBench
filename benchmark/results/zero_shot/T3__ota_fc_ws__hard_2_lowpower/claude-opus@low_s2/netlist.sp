.subckt dut iref inp inn out
* bias mirror (20uA reference)
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* tail current 10uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* input pair
XM1 x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 d inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS mirror load (diode on inn side)
XM3 x d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XM4 d d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* second stage
XM5 out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* Miller compensation with nulling resistor
Rz x xc 5k
Cc xc out 0.6p
.ends dut
