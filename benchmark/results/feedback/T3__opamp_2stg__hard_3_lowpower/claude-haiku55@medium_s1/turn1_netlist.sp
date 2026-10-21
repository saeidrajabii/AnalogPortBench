.subckt dut iref inp inn out
* Bias: 20 uA reference, diode-connected NMOS with gate on iref (current enters the drain)
XMNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
* Tail current source: 30 uA (W/L = 15, mirrored from the reference)
XMNT ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=0.5 nf=1 m=1
* First-stage NMOS differential pair, 15 uA per side, L = 1 um for gain
XM1 net08 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 net9 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* First-stage PMOS active load: diode on net9, mirror to net08
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
* Second stage: PMOS common-source, about 60 uA, gm about 0.9 mS
XMP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* Second-stage NMOS current sink, 60 uA (W/L = 30), gate on iref
XMNS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.5 nf=1 m=1
* Miller compensation with nulling resistor (net08 -> nz -> out)
RR0 net08 nz 3k
CC0 nz out 0.6p
.ends dut
