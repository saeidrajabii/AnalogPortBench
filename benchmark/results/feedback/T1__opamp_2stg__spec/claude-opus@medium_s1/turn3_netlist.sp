* Cascode bias: Iref -> stacked NMOS diodes, gives vb4 = VGS and vb3 ~ 2*VGS
.subckt Cascode_Bias Iin Vbias_3 Vbias_4
RR0  Iin     Vbias_3 1
XMB3 Vbias_3 Vbias_3 Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XMB1 Vbias_4 Vbias_4 0       0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
.ends Cascode_Bias

* Two-stage Miller op-amp: cascoded NMOS input pair + PMOS mirror, PMOS CS 2nd stage
.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
* tail current source (~30 uA)
XMN3 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=1 nf=1 m=1
* input pair
XMN2 nc2 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XMN1 nc1 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
* input-pair cascodes
XMC2 net9  Vbias_3 nc2 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMC1 net08 Vbias_3 nc1 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* PMOS mirror load
XMP1 net9  net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=1
* second stage: PMOS common source, cascoded NMOS sink (~100 uA)
XMP2 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.6 nf=1 m=7
XMN5 vout Vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=5
XMN4 net1 Vbias_4 0    0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=5
* Miller compensation with nulling resistor
RR0 net08 net012 3.5k
CC0 net012 vout 0.5p
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb3 vb4 Cascode_Bias
XI1 vb3 vb4 inn out inp Opamp_2stg
.ends dut
