.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* input mirror (reference current enters the drain of diode MN4)
XMN4  Iin     Iin     0     0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=4
XMN6  Vbias_2 Iin     0     0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=4
XMN7  net2    Iin     0     0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=4
XMN11 Vbias_1 Vbias_1 net2  0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
* PMOS cascode-gate generator (small W/L diode)
XMP4  Vbias_2 Vbias_2 vdd   vdd sky130_fd_pr__pfet_01v8_lvt W=26 L=2 nf=1 m=2
* PMOS wide-swing reference
XMP3  net13   Vbias_1 vdd   vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=40
XMP2  Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=40
* PMOS source feeding the NMOS cascode-gate diode
XMP7  net5    Vbias_1 vdd   vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=40
XMP6  Vbias_3 Vbias_2 net5  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=40
XMN8  Vbias_3 Vbias_3 0     0   sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
* PMOS replica feeding the NMOS wide-swing reference
XMP11 net6    Vbias_1 vdd   vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=40
XMP10 Vbias_4 Vbias_2 net6  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=40
XMN9  Vbias_4 Vbias_3 net10 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
XMN10 net10   Vbias_4 0     0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
XMN0 nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
XMN2 out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=20
XMP1 psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=40
XMP0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=40
.ends dut
