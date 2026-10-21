.subckt Cascode_Bias Iin Vbias_3 Vbias_4
XBN1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XBN0 bn_mid Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XBN3 Vbias_3 Vbias_3 Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XBN2 bp2 Vbias_3 bn_mid 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XBP1 bp1 bp1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XBP0 bp2 bp2 bp1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
RREF Iin Vbias_3 1
.ends Cascode_Bias

.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
CCOMP comp vout 550f
RZERO first comp 2k
XPOUT vout first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=3
XPLOAD first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XPMIR mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XNCAS vout Vbias_3 output_mid 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=3
XNSINK output_mid Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=3
XNINV mirror vm tail_top 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XNNON first vp tail_top 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XNTAIL tail_mid Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=2
XNTAILCAS tail_top Vbias_3 tail_mid 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=2
.ends Opamp_2stg

.subckt dut iref inp inn out
XBIAS iref vb3 vb4 Cascode_Bias
XAMP vb3 vb4 inn out inp Opamp_2stg
.ends dut
