.subckt dut iref inp inn out
* Bias: mirror the 20 uA reference current
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Tail current source, about 40 uA
XMT net10 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* NMOS input pair
XM1 net08 inp net10 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM2 net9 inn net10 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* PMOS mirror load
XM3 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XM4 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* Second stage: PMOS common source, about 200 uA
XM5 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=10
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* Miller compensation with nulling resistor
RZ net08 nz 1.2k
CC nz out 0.5p
.ends dut
