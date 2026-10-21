.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
XN12 Vbias_2 Vbias_2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=1000
XN11 Vbias_1 Vbias_1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=1000

XN10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=1000
XN9 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=1000
XN8 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=200 nf=1 m=1000

XN7 net2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=1000
XN6 net1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=1000
XN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=1000

XP11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=20 nf=1 m=1000
XP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=20 nf=1 m=1000

XP7 net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=20 nf=1 m=1000
XP6 Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=20 nf=1 m=1000

XP4 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=200 nf=1 m=1000

XP3 net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=20 nf=1 m=1000
XP2 Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=20 nf=1 m=1000
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS

XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=1000
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=20 nf=1 m=1000

XP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=20 nf=1 m=1000
XP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=20 nf=1 m=1000
.ends dut
