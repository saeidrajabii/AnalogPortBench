.subckt dut iref inp inn out
* bias: iref mirrored
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* tail current 20uA
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* input pair
XM1  n08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2  n09 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS mirror load
XM3  n09 n09 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM4  n08 n09 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* second stage
XM5  out n08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=12
XM6  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=6
* compensation
RZ   n08 nz 1.5k
CC   nz out 0.3p
.ends dut
