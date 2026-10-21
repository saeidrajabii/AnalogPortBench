.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* NMOS reference mirror (Iin = 20 uA) and level-shift diodes
XMN4  Iin     Iin     0       0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN6  net1    Iin     0       0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN7  net2    Iin     0       0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN12 Vbias_2 Vbias_2 net1    0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN11 Vbias_1 Vbias_1 net2    0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* PMOS cascode-gate generator (W/L = 1/8 of the unit device)
XMP4  Vbias_2 Vbias_2 vdd     vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1 nf=1 m=1
* PMOS wide-swing diode stack -> Vbias_1
XMP3  net13   Vbias_1 vdd     vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
XMP2  Vbias_1 Vbias_2 net13   vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
* PMOS cascode sources feeding the NMOS bias side
XMP7  net5    Vbias_1 vdd     vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
XMP6  Vbias_3 Vbias_2 net5    vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
XMP11 net6    Vbias_1 vdd     vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
XMP10 Vbias_4 Vbias_2 net6    vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
* NMOS cascode-gate generator (W/L = 1/8 of the unit device)
XMN8  Vbias_3 Vbias_3 0       0   sky130_fd_pr__nfet_01v8_lvt W=1.25 L=1 nf=1 m=1
* NMOS wide-swing diode stack -> Vbias_4
XMN9  Vbias_4 Vbias_3 net10   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN10 net10   Vbias_4 0       0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
* NMOS cascode sink
XMN0 nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN2 out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* PMOS cascode source
XMP1 psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
XMP0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
.ends dut
