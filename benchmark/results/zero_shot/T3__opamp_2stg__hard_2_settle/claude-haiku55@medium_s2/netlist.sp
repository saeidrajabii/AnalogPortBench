.subckt dut iref inp inn out
* Bias: diode-connected NMOS at iref (20 uA reference, current enters the drain)
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.6 L=1 nf=1 m=1
* Tail current source, 2x reference (40 uA)
XMT net10 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.6 L=1 nf=1 m=2
* NMOS differential pair (inp drives the output-side device, inn the diode side)
XM1 net08 inp net10 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM2 net9 inn net10 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* PMOS active load mirror (net9 diode-connected)
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* Second stage: PMOS driver (5x mirror of MP0, 100 uA) and NMOS sink (5x reference, 100 uA)
XMP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=5
XMN5 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.6 L=1 nf=1 m=5
* Miller compensation with nulling resistor
RR0 net08 net012 3k
CC0 net012 out 500f
.ends dut
