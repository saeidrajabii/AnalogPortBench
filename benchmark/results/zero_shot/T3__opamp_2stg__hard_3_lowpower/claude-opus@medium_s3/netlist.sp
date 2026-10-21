.subckt Cascode_Bias Iin Vbias_3 Vbias_4
* Iref (20 uA) feeds the drain of the stacked diode MN3, then the diode MN1
XMN3 Iin Iin Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
XMN1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
.ends Cascode_Bias

.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
* first stage: NMOS differential pair, PMOS mirror load, simple tail (30 uA)
XMN1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN2 net9 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN3 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=1
* second stage: PMOS common source, cascoded NMOS sink (80 uA)
XMP2 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XMN5 vout Vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=8
XMN4 net1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=8
* Miller compensation with zero-nulling resistor
RR0 net08 net012 3.5k
CC0 net012 vout 0.45p
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb3 vb4 Cascode_Bias
XI1 vb3 vb4 inn out inp Opamp_2stg
.ends dut
