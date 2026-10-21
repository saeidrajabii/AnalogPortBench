.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
  XM12 Vbias_2 Vbias_2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
  XM11 Vbias_1 Vbias_1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
  XM10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
  XM9 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
  XM8 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3.33 nf=1 m=1
  XM7 net2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
  XM6 net1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
  XM4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1

  XP11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=0.5 nf=1 m=1
  XP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=0.5 nf=1 m=1
  XP7 net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=0.5 nf=1 m=1
  XP6 Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=0.5 nf=1 m=1
  XP4 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=4 nf=1 m=1
  XP3 net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=0.5 nf=1 m=1
  XP2 Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=0.5 nf=1 m=1
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
  XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS

  XM0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
  XM2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
  XP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=0.5 nf=1 m=1
  XP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=55 L=0.5 nf=1 m=1
.ends dut
