.subckt Cascode_Bias Iin Vbp Vbias_3 Vbias_4
* stacked NMOS diodes carry the mirrored 20 uA reference (iref enters a drain)
XMN1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=1 nf=1 m=1
XMN3 Vbias_3 Vbias_3 Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=27 L=1 nf=1 m=1
RR0 Iin Vbias_3 1
* PMOS cascode gate bias (10 uA into a high-density PMOS diode)
XMN6 Vbp Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=1 nf=1 m=1
XMPB Vbp Vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.65 L=0.5 nf=1 m=1
.ends Cascode_Bias

.subckt Opamp_2stg Vbias_3 Vbias_4 Vbp vm vout vp
* first stage: NMOS pair, PMOS mirror load, single tail device (40 uA)
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN2 net9 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XMN1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XMN3 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=1 nf=1 m=2
* second stage: cascoded PMOS common-source with cascoded NMOS sink (160 uA)
XMP2 net2 net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10.4 L=0.35 nf=1 m=12
XMP3 vout Vbp net2 vdd sky130_fd_pr__pfet_01v8_lvt W=11.1 L=0.5 nf=1 m=8
XMN5 vout Vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=0.5 nf=1 m=8
XMN4 net1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=1 nf=1 m=8
* Miller compensation with nulling resistor
RR0 net08 net012 1.5k
CC0 net012 vout 0.7p
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vbp vb3 vb4 Cascode_Bias
XI1 vb3 vb4 vbp inn out inp Opamp_2stg
.ends dut
