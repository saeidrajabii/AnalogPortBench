.subckt Cascode_Bias_WS iin vbias_1 vbias_2 vbias_3 vbias_4
* NMOS reference diode and copies (1:1 mirror of 20 uA)
XMN4  iin      iin      0    0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN6  net1     iin      0    0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN7  net2     iin      0    0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* NMOS cascode bias diodes
XMN12 vbias_2  vbias_2  net1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN11 vbias_1  vbias_1  net2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Vbias_3 pull-down (long-channel, weak)
XMN8  vbias_3  vbias_3  0    0 sky130_fd_pr__nfet_01v8_lvt W=1 L=3 nf=1 m=1
XMN9  vbias_4  vbias_3  net10 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN10 net10    vbias_4  0    0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS bias network
XMP4  vbias_2  vbias_2  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=2 nf=1 m=1
XMP3  net13    vbias_1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP2  vbias_1  vbias_2  net13 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP7  net5     vbias_1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP6  vbias_3  vbias_2  net5 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP11 net6     vbias_1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP10 vbias_4  vbias_2  net6 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
* NMOS cascode sink (1:1 with reference)
XMN0 nsrc vb4 0    0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2 out  vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS cascode source (1:1 with bias mirror device MP3)
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
