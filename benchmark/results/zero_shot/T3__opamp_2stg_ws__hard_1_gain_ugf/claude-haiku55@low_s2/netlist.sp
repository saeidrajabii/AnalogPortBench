.subckt dut iref inp inn out
* Bias: 20 uA reference diode (iref is the drain/gate node, not a source)
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Tail current: 3x mirror -> 60 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=3
* First stage input pair (30 uA each side)
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* First stage PMOS mirror load (diode on the inn side)
XP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP2 n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Second stage: PMOS common source with NMOS current sink (160 uA = 8x mirror)
XM6 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=8
* Miller compensation with nulling resistor
RZ n1 cx 3k
CC cx out 500f
.ends dut
