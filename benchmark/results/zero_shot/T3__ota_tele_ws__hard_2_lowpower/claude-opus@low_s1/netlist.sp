.subckt dut iref inp inn out
* bias mirror
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
* input pair
XM1  d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2  o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* mirror load
XM3  d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
XM4  o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
* second stage
XM5  out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2 nf=1 m=1
XM6  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
* Miller compensation with nulling resistor
Rz   o1 nz 3k
Cc   nz out 1p
.ends dut
