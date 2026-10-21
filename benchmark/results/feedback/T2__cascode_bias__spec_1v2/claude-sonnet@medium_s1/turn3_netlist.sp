.subckt Cascode_Bias Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
RR0 Iin Vbias_4 1
XN1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XNa Vbias_1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XP1 Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XPc Vbias_3 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XN3 Vbias_3 Vbias_3 ns3 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
Rn ns3 0 5k
XNb Vbias_2 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XP0 Vbias_2 Vbias_2 pr vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=1
Rp vdd pr 6k
.ends Cascode_Bias

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.5 nf=1 m=1
XP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=0.5 nf=1 m=1
.ends dut
