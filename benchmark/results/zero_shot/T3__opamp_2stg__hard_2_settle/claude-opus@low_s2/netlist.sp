.subckt Cascode_Bias Iin Vbias_3 Vbias_4
XMN1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN3 Vbias_3 Vbias_3 Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
RR0 Iin Vbias_3 1
.ends Cascode_Bias

.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
CC0 net012 vout 1p
RR0 net08 net012 1k
XMP2 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=8
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMN5 vout Vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=8
XMN4 net1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=8
XMN2 net9 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN3 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb3 vb4 Cascode_Bias
XI1 vb3 vb4 inn out inp Opamp_2stg
.ends dut
