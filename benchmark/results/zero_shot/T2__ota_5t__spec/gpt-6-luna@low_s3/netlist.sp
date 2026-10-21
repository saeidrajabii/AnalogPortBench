.subckt Cascode_Bias Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
  XM1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.7 nf=1 m=1
  XM0 net4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.7 nf=1 m=1
  XM3 Vbias_3 Vbias_3 Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.7 nf=1 m=1
  XM2 Vbias_2 Vbias_3 net4 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.7 nf=1 m=1
  XP1 Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
  XP0 Vbias_2 Vbias_2 Vbias_1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
  RR0 Iin Vbias_3 1
.ends Cascode_Bias

.subckt OTA_5T Vbiasn vm vout vp
  XM2 net9 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.7 nf=1 m=1
  XM1 vout vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.7 nf=1 m=1
  XM0 net10 Vbiasn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.7 nf=1 m=2
  XP0 vout net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
  XP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
.ends OTA_5T

.subckt dut iref inp inn out
  XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias
  XI1 vb4 inn out inp OTA_5T
.ends dut
