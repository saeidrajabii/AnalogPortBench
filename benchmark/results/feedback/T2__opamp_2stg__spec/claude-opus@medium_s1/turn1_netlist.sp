.subckt Cascode_Bias iin vbias_3 vbias_4
* iref (20 uA) goes into the drain of diode-connected MN3, not into a source
XMN1 vbias_4 vbias_4 0       0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN3 vbias_3 vbias_3 vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
R0 iin vbias_3 1
.ends Cascode_Bias

.subckt Opamp_2stg vbias_3 vbias_4 vm vout vp
* first stage: NMOS differential pair, PMOS mirror load, 40 uA tail (no tail cascode, to save headroom)
XMN3 ntail vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
XMN1 net08 vp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN2 net9  vm ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP1 net9  net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* second stage: PMOS common source, cascoded NMOS current sink of 160 uA
XMP2 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.6 nf=1 m=8
XMN5 vout vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=8
XMN4 net1 vbias_4 0 0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=8
* Miller compensation with a nulling resistor
RR0 net08 net012 1.2k
CC0 net012 vout 0.6p
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb3 vb4 Cascode_Bias
XI1 vb3 vb4 inn out inp Opamp_2stg
.ends dut
