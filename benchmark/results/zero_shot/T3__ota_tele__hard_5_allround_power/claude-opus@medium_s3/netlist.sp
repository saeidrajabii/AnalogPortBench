.subckt dut iref inp inn out
* bias reference (20 uA mirrored, 4 uA per unit)
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=5
* tail current source (16 uA)
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
* input pair
XM1  x  inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.7 nf=1 m=1
XM2  d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.7 nf=1 m=1
* PMOS mirror load
XM3  d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XM4  x  d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* second stage: PMOS common source + NMOS sink (72 uA)
XM6  out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=9
XM7  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=18
* Miller compensation with nulling resistor
Rz   x nz 3k
Cc   nz out 0.4p
.ends dut
