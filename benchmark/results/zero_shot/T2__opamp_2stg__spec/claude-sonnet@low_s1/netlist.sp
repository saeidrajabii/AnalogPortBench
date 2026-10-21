.subckt Cascode_Bias Iin Vbias_3 Vbias_4
XN1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.4 nf=1 m=1
XN3 Vbias_3 Vbias_3 Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.4 nf=1 m=1
RR0 Iin Vbias_3 1
.ends Cascode_Bias

.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
CC0 net012 vout 800f m=1
RR0 net08 net012 2k m=1
XP2 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=3
XP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XN5 vout Vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.4 nf=1 m=3
XN4 net1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.4 nf=1 m=3
XN2 net9 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.4 nf=1 m=2
XN1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.4 nf=1 m=2
XN3 net12 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.4 nf=1 m=2
XN0 net10 Vbias_3 net12 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.4 nf=1 m=2
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb3 vb4 Cascode_Bias
XI1 vb3 vb4 inn out inp Opamp_2stg
.ends dut
