.subckt dut iref inp inn out
* bias: diode-connected mirror, 20uA reference
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
* tail current source (~30uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3
* input pair
XM1 n8 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=1 nf=1 m=1
XM2 n9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=1 nf=1 m=1
* PMOS mirror load
XM3 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20.6 L=0.7 nf=1 m=1
XM4 n8 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20.6 L=0.7 nf=1 m=1
* second stage (~80uA)
XM5 out n8 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=0.7 nf=1 m=1
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=8
* Miller compensation with nulling resistor
RZ n8 nz 1.5k
CC nz out 0.6p
.ends dut
