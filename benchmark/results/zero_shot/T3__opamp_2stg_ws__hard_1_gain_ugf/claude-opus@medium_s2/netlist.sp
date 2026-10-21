.subckt Cascode_Bias_LV iref vb3 vb4
* iref node is the cascode gate voltage vb3; the 20 uA flows through R into a drain
RB  iref nb 12k
XMC nb   iref ns 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMB ns   nb   0  0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1   nf=1 m=1
VSH1 iref vb3 0
VSH2 nb vb4 0
.ends Cascode_Bias_LV

.subckt Opamp_2stg_LV vb3 vb4 vm vout vp
* first stage: NMOS pair, PMOS mirror load, 60 uA tail
XMN1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMN2 net9  vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMN3 net10 vb4 0 0    sky130_fd_pr__nfet_01v8_lvt W=8  L=1 nf=1 m=3
XMP1 net9  net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=23 L=1 nf=1 m=3
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=23 L=1 nf=1 m=3
* second stage: PMOS common source, cascoded 240 uA NMOS sink
XMP2 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=24
XMN5 vout vb3 net1 0    sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5  nf=1 m=12
XMN4 net1 vb4 0 0       sky130_fd_pr__nfet_01v8_lvt W=8 L=1    nf=1 m=12
* Miller compensation with nulling resistor
RR0 net08 net012 1.5k
CC0 net012 vout 0.6p
.ends Opamp_2stg_LV

.subckt dut iref inp inn out
XI0 iref vb3 vb4 Cascode_Bias_LV
XI1 vb3 vb4 inn out inp Opamp_2stg_LV
.ends dut
