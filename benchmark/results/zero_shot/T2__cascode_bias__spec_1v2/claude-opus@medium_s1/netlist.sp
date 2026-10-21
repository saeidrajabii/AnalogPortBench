.subckt Cascode_Bias Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* NMOS low-voltage cascode reference (resistor-biased)
RR0 Iin Vbias_3 1
RN  Vbias_3 Vbias_4 10k
XMN3 Vbias_4 Vbias_3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMN1 n1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
* NMOS cascode sink that supplies the PMOS reference current
XMN5 Vbias_2 Vbias_3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMN4 n2 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
* PMOS low-voltage cascode reference (resistor-biased)
XMP1 p1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=5
XMP0 Vbias_1 Vbias_2 p1 p1 sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=5
RP  Vbias_1 Vbias_2 7.5k
.ends Cascode_Bias

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=5
XMP0 out vb2 psrc psrc sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=5
.ends dut
