.subckt dut iref inp inn out
* Bias: iref drives the drain and gate of diode-connected reference NMOS (ratio 1, 20 uA)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* Tail current source, 2x mirror (about 40 uA)
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* First stage: NMOS differential pair with PMOS current-mirror load
XM1 net08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XM2 net9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
* Second stage: PMOS common source with 4x NMOS current sink (about 80 uA)
XMP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XMN2 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* Miller compensation with nulling resistor
RR0 net08 net012 3k
CC0 net012 out 500f
.ends dut
