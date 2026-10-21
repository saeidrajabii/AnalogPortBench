.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
XIREF Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

XN6 net1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XN7 net2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XN11 Vbias_1 Vbias_1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XN12 Vbias_2 Vbias_2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

XP3 net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP2 Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP4 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=3 nf=1 m=1

XP7 net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP6 Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XN8 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2.5 nf=1 m=1

XP11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XN9 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XN10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
.ends Cascode_Bias_WS

.subckt OTA_Folded_Cascode Vbias_2 Vbias_3 Vbias_4 vm vout vp
XN3 net020 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XN4 net019 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XN0 net08 Vbias_3 net020 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XN5 net08 Vbias_3 net019 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XN2 net010 vp net08 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XN1 net016 vm net08 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

XP0 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP1 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP2 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP3 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP4 net1 Vbias_2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP5 vout Vbias_2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

XN7 net018 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XN6 net1 Vbias_3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XN8 net017 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XN9 vout Vbias_3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
.ends OTA_Folded_Cascode

.subckt dut iref inp inn out
XBIAS iref vb1 vb2 vb3 vb4 Cascode_Bias_WS
XOTA vb2 vb3 vb4 inn out inp OTA_Folded_Cascode
.ends dut
