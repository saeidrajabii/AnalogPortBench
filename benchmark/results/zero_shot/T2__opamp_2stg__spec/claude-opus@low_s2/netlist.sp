.subckt dut iref inp inn out
* Bias: 20uA reference into a diode-connected NMOS
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
* Tail current source, about 40uA
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
* NMOS input pair
XM1  n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2  n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS mirror load
XM3  n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XM4  n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* Second stage: PMOS common source with NMOS current sink, about 150uA
XM5  out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=6
XM6  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=2 nf=1 m=4
* Miller compensation with nulling resistor
RZ   n2 nc 1k
CC   nc out 0.5p
.ends dut
