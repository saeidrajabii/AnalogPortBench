.subckt dut iref inp inn out
* Bias mirror: 20 uA reference -> 10 uA per unit device
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
* Tail current source, about 30 uA
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3
* NMOS input pair
XM1  d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2  d2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS mirror load
XM3  d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM4  d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Second stage: PMOS common source with NMOS current-sink load, about 120 uA
XM6  out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=8
XM7  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=12
* Miller compensation with nulling resistor
RZ   d2 nz 1k
CC   nz out 0.6p
.ends dut
