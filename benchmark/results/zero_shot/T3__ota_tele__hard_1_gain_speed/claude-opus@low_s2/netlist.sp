.subckt dut iref inp inn out
* bias: iref (20uA) -> NMOS diode reference
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
* tail current source (~40uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
* input pair
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XM2 o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
* PMOS mirror load
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
XM4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
* second stage: PMOS common source (~80uA) with NMOS current sink
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2 nf=1 m=1
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=2 nf=1 m=1
* Miller compensation with nulling resistor
Rz o1 cz 1.5k
Cc cz out 0.8p
.ends dut
