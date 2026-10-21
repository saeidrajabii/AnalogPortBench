.subckt dut iref inp inn out
* Bias: 20 uA reference diode, gate tied to iref (current enters the drain)
XMNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
* Tail source: 30 uA (W/L = 15, mirrored from the reference)
XMNT ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=0.5 nf=1 m=1
* Input pair: 15 uA per side, L = 2 um to reduce channel-length modulation
XM1 net08 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XM2 net9 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
* First-stage PMOS load: diode on net9, mirror to net08 (L = 2 um)
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2 nf=1 m=1
* Second stage: PMOS common source, about 75 uA, gm about 1.2 mS
XMP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=53 L=0.5 nf=1 m=1
* Output current sink: 75 uA (W/L = 37.5), gate on iref, L = 2 um
XMNS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=75 L=2 nf=1 m=1
* Miller compensation with nulling resistor (net08 -> nz -> out)
RR0 net08 nz 5.5k
CC0 nz out 0.4p
.ends dut
