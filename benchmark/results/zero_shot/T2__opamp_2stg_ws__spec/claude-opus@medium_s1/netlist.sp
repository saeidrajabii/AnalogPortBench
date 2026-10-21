.subckt Bias_Stack Iin vbn
* iref -> diode MB2 (gate=drain=Iin, sets cascode bias) -> diode MB1 (sets mirror bias vbn)
XMB2 Iin Iin vbn 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMB1 vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
.ends Bias_Stack

.subckt Opamp_2stg vbn vcas vm vout vp
* Miller compensation with nulling resistor
CC0 net012 vout 0.6p
RR0 net08 net012 2k
* second stage: PMOS common source, cascoded NMOS sink (200 uA)
XMP2 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=4
XMN5 vout vcas net1 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=10
XMN4 net1 vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=10
* first stage: NMOS differential pair, PMOS mirror load, 40 uA tail
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN2 net9 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMN1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMN3 net10 vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=2
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vbn Bias_Stack
XI1 vbn iref inn out inp Opamp_2stg
.ends dut
