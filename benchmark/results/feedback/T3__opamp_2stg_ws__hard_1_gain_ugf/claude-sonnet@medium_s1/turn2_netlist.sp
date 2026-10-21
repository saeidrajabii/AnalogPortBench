.subckt Cascode_Bias_WS Iin Vbias_3 Vbp
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMPA pa pa vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XMNA pa Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMPB nb pa vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XMPC Vbp Vbp nb vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=5.6 nf=1 m=1
XMNB Vbp Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMPD Vbias_3 pa vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XMN9 Vbias_3 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=3.5 nf=1 m=1
XMN10 net10 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
.ends Cascode_Bias_WS

.subckt Opamp_2stg Vbias_3 Vbias_4 Vbp vm vout vp
CC0 net012 vout 500f
RR0 net08 net012 1.2k
XMP2 net20 net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.8 nf=1 m=4
XMPC2 vout Vbp net20 vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.8 nf=1 m=4
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.8 nf=1 m=1
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.8 nf=1 m=1
XMN5 vout Vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=8
XMN4 net1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=8
XMN2 net9 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMN1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMN3 net12 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=4
XMN0 net10 Vbias_3 net12 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=4
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb3 vbp Cascode_Bias_WS
XI1 vb3 iref vbp inn out inp Opamp_2stg
.ends dut
