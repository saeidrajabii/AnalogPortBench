.subckt dut iref inp inn out
* Bias reference diode (20 uA), unit W=12 L=2 -> 2 uA per unit
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=10
* Tail current source: 8 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=4
* Input pair (inn on diode side, inp on output side)
XM1 xd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XM2 x2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
* PMOS mirror load
XM3 xd xd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1.5 nf=1 m=1
XM4 x2 xd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1.5 nf=1 m=1
* Second stage: PMOS common source (~14 uA) with NMOS current-sink load
XM6 out x2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6.5 L=0.7 nf=1 m=4
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=7
* Miller compensation with nulling resistor
Rz x2 nz 12k
Cc nz out 0.65p
.ends dut
