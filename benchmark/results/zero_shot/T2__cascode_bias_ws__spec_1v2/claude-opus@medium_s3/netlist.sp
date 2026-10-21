.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* Reference current input mirror (Iin -> two 20uA sinks)
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=4
XMN6 Vbias_2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=4
XMN7 Vbias_1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=4
* PMOS cascode-gate bias: Vbias_2 = VDD - Vsg - I*Rp
XMP4 ny ny vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=12
Rp ny Vbias_2 9k
* PMOS low-voltage cascode reference (generates Vbias_1)
XMP3 net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=12
XMP2 Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=12
* PMOS copies feeding the NMOS bias branches
XMP7 net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=12
XMP6 Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=12
XMP11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=12
XMP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=12
* NMOS cascode-gate bias: Vbias_3 = Vgs + I*Rn
Rn Vbias_3 nx 9k
XMN8 nx nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
* NMOS low-voltage cascode reference (generates Vbias_4)
XMN9 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=12
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=12
.ends dut
