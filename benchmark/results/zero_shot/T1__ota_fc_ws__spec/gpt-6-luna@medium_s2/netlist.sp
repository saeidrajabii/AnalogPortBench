.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
  XM_N12 Vbias_2 Vbias_2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N11 Vbias_1 Vbias_1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N9 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N8 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=3.33 nf=1 m=1
  XM_N7 net2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N6 net1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1

  XM_P11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
  XM_P10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
  XM_P7 net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
  XM_P6 Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
  XM_P4 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=4 nf=1 m=1
  XM_P3 net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
  XM_P2 Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
.ends Cascode_Bias_WS

.subckt OTA_Folded_Cascode Vbias_2 Vbias_3 Vbias_4 vm vout vp
  XM_N6 net1 Vbias_3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N0 net08 Vbias_3 net020 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N2 net010 vp net08 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N9 vout Vbias_3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N1 net016 vm net08 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N8 net017 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N4 net019 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N3 net020 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N5 net08 Vbias_3 net019 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
  XM_N7 net018 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1

  XM_P4 net1 Vbias_2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
  XM_P5 vout Vbias_2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
  XM_P1 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
  XM_P3 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
  XM_P2 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
  XM_P0 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
.ends OTA_Folded_Cascode

.subckt dut iref inp inn out
  XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_WS
  XI1 vb2 vb3 vb4 inn out inp OTA_Folded_Cascode
.ends dut
