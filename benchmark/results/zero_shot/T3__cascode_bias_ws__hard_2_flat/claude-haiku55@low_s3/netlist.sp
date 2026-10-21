.subckt dut iin out vb1 vb2 vb3 vb4
* Reference mirror: iin is the diode-connected reference (20 uA)
XMN4 iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Bias copies of the reference current
XMN6 net1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN7 net2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Bias generator for vb2 (NMOS diode stack over net1)
XMN12 vb2 vb2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Bias generator for vb1 (NMOS diode stack over net2)
XMN11 vb1 vb1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Bias generator for vb4 / vb3
XMN10 net10 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN9 vb4 vb3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN8 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* PMOS bias network (vb1, vb2, vb3 generation)
XMP4 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP11 net6 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP10 vb4 vb2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP7 net5 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP6 vb3 vb2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP3 net13 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP2 vb1 vb2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* Output NMOS cascode sink (same W/L as reference, so ratio 1)
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Output PMOS cascode source (same W/L as bias PMOS, so ratio 1)
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
