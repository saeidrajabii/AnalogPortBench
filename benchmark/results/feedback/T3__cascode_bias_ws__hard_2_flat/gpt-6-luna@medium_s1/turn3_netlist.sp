.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* NMOS cascode-bias stack and its reference-current mirror
XNREF Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
XNB4 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
XNB3 Vbias_3 Vbias_3 Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
XNBM Vbias_3 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1

* PMOS cascode-bias stack, with an NMOS mirror sink
XPB1 Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=2 nf=1 m=1
XPB2 Vbias_2 Vbias_2 Vbias_1 vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=2 nf=1 m=1
XPN Vbias_2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS

* NMOS cascode current sink
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1

* PMOS cascode current source
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=2 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=2 nf=1 m=1
.ends dut
