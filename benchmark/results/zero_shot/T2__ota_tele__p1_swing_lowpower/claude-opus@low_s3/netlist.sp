.subckt dut iref inp inn out
* Bias: 20 uA reference, NMOS mirror
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* Tail current source (20 uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* Input differential pair
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XM2 o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
* PMOS mirror load
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XM4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* Second stage: PMOS common source with NMOS current sink (60 uA)
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=6
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=3
* Miller compensation with nulling resistor
Rz o1 nz 2k
Cc nz out 1.2p
.ends dut
