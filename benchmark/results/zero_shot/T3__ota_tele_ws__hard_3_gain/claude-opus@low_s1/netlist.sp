.subckt dut iref inp inn out
* bias: reference diode
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* tail current source (40 uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
* input pair
XM1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM2 o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* PMOS mirror load
XM3 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XM4 o1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
* second stage
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=5
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=5
* Miller compensation with nulling resistor
Rz o1 nz 2k
Cc nz out 2p
.ends dut
