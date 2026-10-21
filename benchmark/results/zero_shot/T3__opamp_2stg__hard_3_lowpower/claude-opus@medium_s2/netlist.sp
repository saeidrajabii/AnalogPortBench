.subckt Cascode_Bias Iin Vbias_3 Vbias_4
* Iin (20 uA) flows into the drain/gate of the stacked diode MN3, then into the diode MN1
XMN3 Iin Iin Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=4
XMN1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
.ends Cascode_Bias

.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
* tail current source, 20 uA
XMN3 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
* NMOS input pair
XMN2 net9 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMN1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* PMOS mirror load
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.6 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.6 nf=1 m=1
* second stage: PMOS common source, cascoded NMOS sink, 90 uA
XMP2 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=9
XMN5 vout Vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=6
XMN4 net1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=9
* Miller compensation with nulling resistor
RR0 net08 net012 3.5k
CC0 net012 vout 450f
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb3 vb4 Cascode_Bias
XI1 vb3 vb4 inn out inp Opamp_2stg
.ends dut
