.subckt dut iref inp inn out
* Bias: iref is the diode-connected drain of XMB3, so the reference current
* does not flow into a source. XMB1 is the bottom current-source diode (vb4).
XMB3 iref iref vb4 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMB1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Miller compensation with nulling resistor
Cc0 net012 out 400f
Rz0 net08 net012 3k

* Second stage: PMOS common source (long L for gain), NMOS cascode sink
XMP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1
XMN5 out iref net1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=7
XMN4 net1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=7

* First stage: PMOS mirror load, long-channel NMOS pair, plain NMOS tail
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=3 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=3 nf=1 m=1
XMN2 net9 inn net10 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=2 nf=1 m=1
XMN1 net08 inp net10 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=2 nf=1 m=1
XMN3 net10 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=2
.ends dut
