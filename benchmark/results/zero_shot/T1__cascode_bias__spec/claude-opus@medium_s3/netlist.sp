.subckt Cascode_Bias Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* NMOS reference branch (Iin mirrored, self-biased wide-swing cascode)
RR0  Iin Vbias_3 1
RN   Vbias_3 Vbias_4 12k
XNC1 Vbias_4 Vbias_3 na1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XNB1 na1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* NMOS cascode copy sinks Iref from the PMOS reference branch
XNC2 Vbias_2 Vbias_3 na2 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XNB2 na2 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* PMOS reference branch (self-biased wide-swing cascode)
RP   Vbias_1 Vbias_2 12k
XPC2 Vbias_1 Vbias_2 pa2 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
XPB2 pa2 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
.ends Cascode_Bias

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias
* NMOS cascode sink
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* PMOS cascode source
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
.ends dut
