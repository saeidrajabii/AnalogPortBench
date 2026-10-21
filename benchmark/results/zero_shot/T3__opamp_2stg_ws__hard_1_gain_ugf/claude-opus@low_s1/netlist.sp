.subckt dut iref inp inn out
* bias: iref mirrored by NMOS diode
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* tail current source, 3x mirror = 60 uA
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=3
* NMOS input pair
XM1  n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2  n9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* PMOS mirror load
XM3  n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XM4  n1 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
* second stage: PMOS common source + NMOS current sink (10x = 200 uA)
XM5  out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=17 L=0.5 nf=1 m=1
XM6  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=10
* Miller compensation with nulling resistor
RZ n1 nc 1.2k
CC nc out 0.7p
.ends dut
