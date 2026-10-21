.subckt dut iref inp inn out
* Bias: iref is the diode-connected drain of MB3, so the reference current is not
* injected into a source. MB1 is the bottom current-source diode (vb4). The gate
* of MB3 (iref) supplies the cascode bias for the tail and output cascodes.
XMB3 iref iref vb4 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMB1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Two-stage Miller-compensated op-amp (vp = inp, vm = inn)
* Miller compensation with nulling resistor
CC0 net012 out 500f
RZ0 net08 net012 3k

* Second stage: PMOS common source, NMOS cascode sink
XMP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMN5 out iref net1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=5
XMN4 net1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=5

* First stage: PMOS mirror load, NMOS differential pair, NMOS cascoded tail
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMN2 net9 inn net10 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMN1 net08 inp net10 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMN0 net10 iref net12 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=2
XMN3 net12 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=2
.ends dut
