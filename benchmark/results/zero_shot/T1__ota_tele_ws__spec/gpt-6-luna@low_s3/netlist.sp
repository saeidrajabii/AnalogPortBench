.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
XM12 Vbias_2 Vbias_2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.36 nf=1 m=1
XM11 Vbias_1 Vbias_1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.36 nf=1 m=1
XM10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.36 nf=1 m=1
XM9 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.36 nf=1 m=1
XM8 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=3.33 nf=1 m=1
XM7 net2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.36 nf=1 m=1
XM6 net1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.36 nf=1 m=1
XM4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.36 nf=1 m=1

XP11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.36 nf=1 m=1
XP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.36 nf=1 m=1
XP7 net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.36 nf=1 m=1
XP6 Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.36 nf=1 m=1
XP4 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=4 nf=1 m=1
XP3 net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.36 nf=1 m=1
XP2 Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.36 nf=1 m=1
.ends Cascode_Bias_WS

.subckt OTA_Telescopic VCM Vbias_2 Vbias_3 Vbias_4 vm vout vp
XP0 net0100 net082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.43 L=0.36 nf=1 m=5
XP3 vout Vbias_2 net097 vdd sky130_fd_pr__pfet_01v8_lvt W=2.43 L=0.36 nf=1 m=5
XP4 net016 Vbias5 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.43 L=0.36 nf=1 m=1
XP2 net097 net082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.43 L=0.36 nf=1 m=5
XP1 net082 Vbias_2 net0100 vdd sky130_fd_pr__pfet_01v8_lvt W=2.43 L=0.36 nf=1 m=5
XP5 Vbias5 Vbias_2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=2.43 L=0.36 nf=1 m=1

XM11 Vbias5 Vbias5 net015 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=1
XM8 net015 VCM net014 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=1
XM4 net8 Vbias_3 net012 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=5
XM5 net012 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=5
XM9 net014 Vbias_3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=1
XM1 net074 vp net8 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=5
XM6 net6 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=5
XM3 net030 vm net8 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=5
XM7 net8 Vbias_3 net6 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=5
XM0 net082 Vbias5 net074 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=5
XM2 vout Vbias5 net030 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=5
XM10 net017 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=1
.ends OTA_Telescopic

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_WS
Rcm1 vdd vcmref 5meg
Rcm2 vcmref 0 5meg
XI1 vcmref vb2 vb3 vb4 inn out inp OTA_Telescopic
.ends dut
