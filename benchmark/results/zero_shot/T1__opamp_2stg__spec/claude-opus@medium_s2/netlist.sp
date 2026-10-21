.subckt Cascode_Bias Iin Vbias_3 Vbias_4
* 20 uA reference: stacked diodes MN3 (cascode bias) over MN1 (mirror bias)
XMN1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1
XMN3 Vbias_3 Vbias_3 Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
RR0 Iin Vbias_3 1
.ends Cascode_Bias

.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
* Miller compensation with nulling resistor
CC0 net012 vout 0.6p
RR0 net08 net012 3k
* first stage: NMOS diff pair, PMOS mirror load, 40 uA tail (2x mirror)
XMN1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=56 L=0.7 nf=1 m=1
XMN2 net9 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=56 L=0.7 nf=1 m=1
XMN0 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=2
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
* second stage: PMOS common source, cascoded 100 uA NMOS sink (5x mirror)
XMP2 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=5
XMN5 vout Vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=5
XMN4 net1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=5
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb3 vb4 Cascode_Bias
XI1 vb3 vb4 inn out inp Opamp_2stg
.ends dut
