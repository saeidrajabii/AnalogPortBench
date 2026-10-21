.subckt Cascode_Bias_WS Iin Vbias_3 Vbias_4
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMNs pb Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMPd pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.2 nf=1 m=1
XMPe Vbias_3 pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.2 nf=1 m=1
XMNb Vbias_3 Vbias_3 y 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
RB y 0 8k
RV4 Iin Vbias_4 1
.ends Cascode_Bias_WS

.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
CC0 net012 vout 0.8p
RR0 net08 net012 1.2k
XMP2 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.2 nf=1 m=3
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.2 nf=1 m=1
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.2 nf=1 m=1
XMN5 vout Vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=6
XMN4 net1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=6
XMN2 net9 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.8 nf=1 m=1
XMN1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.8 nf=1 m=1
XMN3 net12 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=4
XMN0 net10 Vbias_3 net12 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=4
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb3 vb4 Cascode_Bias_WS
XI1 vb3 vb4 inn out inp Opamp_2stg
.ends dut
