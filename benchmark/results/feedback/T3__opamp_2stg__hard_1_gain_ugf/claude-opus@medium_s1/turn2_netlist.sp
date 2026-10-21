.subckt Cascode_Bias Iin Vbias_4
XMB2 Iin Iin Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=5
XMB1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=5
.ends Cascode_Bias

.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
* first stage: NMOS input pair, PMOS mirror load, simple tail
XM1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XM2 net9 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XM3 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XM4 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMT net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=9
* second stage: PMOS common source, cascoded NMOS sink
XM6 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMN5 vout Vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=40
XMN4 net1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=40
* Miller compensation with nulling resistor
RZ net08 net012 1.5k
CC net012 vout 0.5p
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb4 Cascode_Bias
XI1 iref vb4 inn out inp Opamp_2stg
.ends dut
