.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
XNref Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1

XN1 net1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XN2 net2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XN3 Vbias_2 Vbias_2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XN4 Vbias_1 Vbias_1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1

XPbias Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=18 nf=1 m=1
XP1 net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1
XP2 Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1

XP3 net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1
XP4 Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1
XNbias Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=18 nf=1 m=1

XP5 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1
XP6 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1
XN5 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XN6 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XBIAS iin vb1 vb2 vb3 vb4 Cascode_Bias_WS

XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1
XP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=2 nf=1 m=1

* Candidate port; numerical compliance requires the testbench model library.
.ends dut
