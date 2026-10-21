.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
  XM12 Vbias_2 Vbias_2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM11 Vbias_1 Vbias_1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM9 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM8 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=3.0 nf=1 m=1
  XM7 net2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM6 net1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XP11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18.3 L=0.6 nf=1 m=1
  XP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=18.3 L=0.6 nf=1 m=1
  XP7 net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18.3 L=0.6 nf=1 m=1
  XP6 Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=18.3 L=0.6 nf=1 m=1
  XP4 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18.3 L=3.5 nf=1 m=1
  XP3 net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18.3 L=0.6 nf=1 m=1
  XP2 Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=18.3 L=0.6 nf=1 m=1
.ends Cascode_Bias_WS

.subckt OTA_Folded_Cascode Vbias_2 Vbias_3 Vbias_4 vm vout vp
  XM6 net1 Vbias_3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM0 net08 Vbias_3 net020 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM2 net010 vp net08 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM9 vout Vbias_3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM1 net016 vm net08 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM8 net017 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM4 net019 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM3 net020 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM5 net08 Vbias_3 net019 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XM7 net018 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
  XP4 net1 Vbias_2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=18.3 L=0.6 nf=1 m=1
  XP5 vout Vbias_2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=18.3 L=0.6 nf=1 m=1
  XP1 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18.3 L=0.6 nf=1 m=1
  XP3 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18.3 L=0.6 nf=1 m=1
  XP2 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18.3 L=0.6 nf=1 m=1
  XP0 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18.3 L=0.6 nf=1 m=1
.ends OTA_Folded_Cascode

.subckt dut iref inp inn out
  XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_WS
  XI1 vb2 vb3 vb4 inn out inp OTA_Folded_Cascode
.ends dut
