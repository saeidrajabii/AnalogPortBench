.subckt Cascode_Bias Iin Vbias_2 Vbias_3 Vbias_4
XN1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XN3 Vbias_3 Vbias_3 Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNP Vbias_2 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP1 Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XP0 Vbias_2 Vbias_2 Vbias_1 vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.7 nf=1 m=1
RR0 Iin Vbias_3 1
.ends Cascode_Bias

.subckt Opamp_2stg Vbias_2 Vbias_3 Vbias_4 vm vout vp
CC0 net012 vout 0.4p
RR0 net08 net012 800
XP2 net2 net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.7 nf=1 m=4
XPC vout Vbias_2 net2 vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.7 nf=1 m=4
XP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XN5 vout Vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=6
XN4 net1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=6
XN2 net9 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.8 nf=1 m=1
XN1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.8 nf=1 m=1
XN3 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=3
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb2 vb3 vb4 Cascode_Bias
XI1 vb2 vb3 vb4 inn out inp Opamp_2stg
.ends dut
