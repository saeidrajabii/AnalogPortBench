.subckt dut iref inp inn out
* bias: diode-connected mirror, 20uA reference
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
* tail current source (~30uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3
* input pair (long L for gain)
XM1 n8 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=1
XM2 n9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=1
* PMOS mirror load
XM3 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=44 L=1.5 nf=1 m=1
XM4 n8 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=44 L=1.5 nf=1 m=1
* second stage (~80uA)
XM5 out n8 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=157 L=1 nf=1 m=1
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=8
* Miller compensation with nulling resistor
RZ n8 nz 2k
CC nz out 0.45p
.ends dut
