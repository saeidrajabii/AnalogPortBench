.subckt dut iref inp inn out
* Bias: 20 uA reference mirrored, no current injected into a transistor source
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* Tail current source (20 uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* NMOS input pair (weak/moderate inversion)
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 o1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS mirror load
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XM4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* Second stage: PMOS common source (10x load, ~100 uA) with NMOS sink (5x mirror)
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=10
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=5
* Miller compensation with nulling resistor
Rz o1 nz 1.5k
Cc nz out 0.6p
.ends dut
