.subckt dut iref inp inn out
* bias: mirror 20uA reference
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* tail current 20uA
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* input pair
XM1  d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2  d2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS mirror load
XM3  d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XM4  d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* second stage: PMOS common source, NMOS sink (80uA)
XM5  out d2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=8
XM6  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=4
* Miller compensation with nulling resistor
Rz   d2 cz 1.5k
Cc   cz out 1.5p
.ends dut
