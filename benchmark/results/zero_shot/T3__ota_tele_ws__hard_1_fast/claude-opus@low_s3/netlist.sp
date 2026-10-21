.subckt dut iref inp inn out
* Bias: 20uA reference into an NMOS diode, mirrored to the other NMOS devices
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Tail current source (40 uA)
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
* NMOS input pair
XM1  d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.4 nf=1 m=1
XM2  o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.4 nf=1 m=1
* PMOS mirror load
XM3  d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM4  o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* Second stage: PMOS common source (140 uA) with NMOS current sink
XM5  out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=7
XM6  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=7
* Miller compensation with nulling resistor
Rz   o1 nz 1.5k
Cc   nz out 0.55p
.ends dut
