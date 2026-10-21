.subckt Cascode_Bias Iin Vbias_3 Vbias_4
XN1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XN3 Vbias_3 Vbias_3 Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
RR0 Iin Vbias_3 1
.ends Cascode_Bias

.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
CC0 net012 vout 0.6p
RR0 net08 net012 1.2k
XP2 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=4
XP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XN5 vout Vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=6
XN4 net1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=6
XN2 net9 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XN1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XN3 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=3
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb3 vb4 Cascode_Bias
XI1 vb3 vb4 inn out inp Opamp_2stg
.ends dut
