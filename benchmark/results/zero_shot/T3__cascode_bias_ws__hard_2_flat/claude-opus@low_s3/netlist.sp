.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
XMN12 Vbias_2 Vbias_2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN11 Vbias_1 Vbias_1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN9 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN8 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=5 nf=1 m=4
XMN7 net2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN6 net1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMP11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=13
XMP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=13
XMP7 net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=13
XMP6 Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=13
XMP4 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=5 nf=1 m=13
XMP3 net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=13
XMP2 Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=13
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=13
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=13
.ends dut
