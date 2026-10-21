.subckt dut iref inp inn out
* Bias: diode-connected reference (20 uA from ideal source)
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.6 L=1 nf=1 m=1
* Tail current sink, ~60 uA (3x reference)
XMBT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* NMOS input differential pair (inp -> net08 side, inn -> diode side)
XM1 net08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM2 net9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* PMOS current-mirror load
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=27 L=0.7 nf=1 m=1
XP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=27 L=0.7 nf=1 m=1
* Second stage: PMOS common source with NMOS current sink (~100 uA)
XP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=44 L=0.35 nf=1 m=1
XN5 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=33 L=1 nf=1 m=1
* Miller compensation with nulling resistor
CC0 net012 out 500f
RZ0 net08 net012 2.5k
.ends dut
