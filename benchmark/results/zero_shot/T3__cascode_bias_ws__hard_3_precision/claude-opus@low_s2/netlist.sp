.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* NMOS reference: low-voltage cascode input
XMN4  nx    Iin     0   0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMN4C Iin   Vbias_3 nx  0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
* NMOS copies feeding the PMOS bias branches (cascoded identically)
XMN6  net1  Iin     0    0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMN12 Vbias_2 Vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMN7  net2  Iin     0    0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMN11 Vbias_1 Vbias_3 net2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
* PMOS cascode-gate generator (W/L reduced ~12x)
XMP4  Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6.7 L=2 nf=1 m=1
* PMOS wide-swing reference
XMP3  net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP2  Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
* PMOS copies feeding NMOS bias branches
XMP7  net5  Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP6  Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP11 net6  Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
* NMOS cascode-gate generator (W/L reduced ~12x)
XMN8  Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.3 L=2 nf=1 m=1
* NMOS wide-swing reference for output sink
XMN10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMN9  Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
.ends dut
