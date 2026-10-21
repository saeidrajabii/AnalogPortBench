.subckt dut iref inp inn out
* Bias: iref is the diode-connected reference (20 uA). The mirror gate node is iref.
XMR  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* Tail current source, 3x mirror, about 60 uA
XMT  tailn iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
* Second-stage sink, 7.5x mirror, about 150 uA
XMS  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* First stage: NMOS differential pair (inp on net08 side, inn on net9 side)
XM1  net08 inp tailn 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM2  net9  inn tailn 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* First-stage PMOS loads: diode on net9, mirror output on net08
XP1  net9  net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=76 L=1 nf=1 m=1
XP0  net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=76 L=1 nf=1 m=1

* Second stage: PMOS common-source driven from net08, sinking into XMS
XP2  out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=214 L=1 nf=1 m=1

* Miller compensation with nulling resistor
RR0  net08 net012 3k
CC0  net012 out 500f
.ends dut
