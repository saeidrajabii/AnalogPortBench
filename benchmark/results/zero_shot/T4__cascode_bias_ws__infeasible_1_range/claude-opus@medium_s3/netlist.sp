.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* NMOS reference diode and mirrors
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
XMN6 Vbias_2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
XMN7 net2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
XMN11 Vbias_1 Vbias_1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
* PMOS cascode gate generator: diode + series resistor (Vbias_2)
RP vdd psr 6.5k
XMP4 Vbias_2 Vbias_2 psr vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=16
* PMOS wide-swing mirror reference (Vbias_1)
XMP3 net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=16
XMP2 Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=16
* PMOS copies feeding NMOS bias branches
XMP7 net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=16
XMP6 Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=16
XMP11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=16
XMP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=16
* NMOS cascode gate generator: diode + series resistor (Vbias_3)
XMN8 Vbias_3 Vbias_3 nsr 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
RN nsr 0 7k
* NMOS wide-swing mirror reference (Vbias_4)
XMN9 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
XMN10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=16
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=16
.ends dut
