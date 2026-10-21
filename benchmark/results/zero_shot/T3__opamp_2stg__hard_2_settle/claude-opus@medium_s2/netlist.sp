.subckt Cascode_Bias Iin Vbias_3 Vbias_4
* stacked diode reference: Iin (20uA) -> cascode diode -> bottom diode
XMB3 Vbias_3 Vbias_3 Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=4
XMB1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
.ends Cascode_Bias

.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
* first stage: NMOS pair, split tails with source-degeneration resistor
XMN1 net08 vp nsa 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN2 net9 vm nsb 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
RS nsa nsb 2.5k
XMT1 nsa Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=6
XMT2 nsb Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=6
* PMOS mirror load
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=2
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=2
* second stage: PMOS common source, cascoded NMOS sink
XMP2 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=10
XMN5 vout Vbias_3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=30
XMN4 net1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=30
* Miller compensation with nulling resistor
RZ net08 net012 2k
CC net012 vout 0.45p
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb3 vb4 Cascode_Bias
XI1 vb3 vb4 inn out inp Opamp_2stg
.ends dut
