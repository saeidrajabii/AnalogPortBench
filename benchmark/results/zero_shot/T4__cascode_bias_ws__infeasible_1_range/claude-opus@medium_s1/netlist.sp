.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* input diode and NMOS mirrors (20uA each)
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=2
XMN6 Vbias_2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=2
XMN7 Vbias_1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=2
* PMOS cascode-gate diode (low W/L)
XMP4 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
* PMOS wide-swing cascoded diode -> Vbias_1
XMP3 net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=4
XMP2 Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=4
* PMOS cascode sources feeding NMOS bias branches
XMP7 net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=4
XMP6 Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=4
XMP11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=4
XMP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=4
* NMOS cascode-gate diode (low W/L)
XMN8 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
* NMOS wide-swing cascoded diode -> Vbias_4
XMN9 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=2
XMN10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=2
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=2
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=2
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=4
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=4
.ends dut
