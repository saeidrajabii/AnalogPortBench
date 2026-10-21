.subckt Cascode_Bias_WS iin vb1 vb2 vb3 vb4
* NMOS bias network (same connectivity as source)
XMN12 vb2 vb2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN11 vb1 vb1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN10 net10 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN9 vb4 vb3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN8 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN7 net2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN6 net1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN4 iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* PMOS bias network
XMP11 net6 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMP10 vb4 vb2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMP7 net5 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMP6 vb3 vb2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMP4 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMP3 net13 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMP2 vb1 vb2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
* NMOS cascode sink
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* PMOS cascode source
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
.ends dut
