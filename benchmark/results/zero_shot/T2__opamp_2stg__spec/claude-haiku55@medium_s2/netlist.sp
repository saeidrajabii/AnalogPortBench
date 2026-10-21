.subckt dut iref inp inn out
* Bias: iref drives the diode-connected reference NMOS MNB (20 uA).
* Its gate node is iref, so the tail and second-stage sink mirror it.
XMNB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Tail current source, 2x mirror (40 uA)
XMNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
* NMOS input differential pair
XMN1 net9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMN2 net08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
* PMOS current-mirror active load (diode-connected on the inn side)
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=1 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=1 nf=1 m=1
* Second stage: PMOS common-source driver and NMOS current sink (100 uA, 5x mirror)
XMP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XMNS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=5
* Miller compensation with nulling resistor
CC0 net012 out 500f
RR0 net08 net012 3k
.ends dut
