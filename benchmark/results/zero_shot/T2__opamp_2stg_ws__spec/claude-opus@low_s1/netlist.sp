.subckt Cascode_Bias_LV iref vb3 vb4
* iref -> cascoded NMOS diode; vb4 = mirror gate
XMC  iref vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMD  vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* copy 20uA to PMOS mirror, then into long-L NMOS diode for cascode bias vb3
XMN5 np vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMP1 np np vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP2 vb3 np vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN8 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=3 nf=1 m=1
.ends Cascode_Bias_LV

.subckt Opamp_2stg_LV vb3 vb4 vm vout vp
* first stage: NMOS pair, PMOS mirror load, simple tail (40uA)
XMT  tail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
XM1  n08 vp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2  n9 vm tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP0 n08 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* second stage: PMOS CS, cascoded NMOS sink (~150uA)
XMP2 vout n08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=8
XMN5 vout vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=3
XMN4 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=3
* Miller compensation with nulling resistor
RZ n08 nz 1.5k
CC nz vout 0.5p
.ends Opamp_2stg_LV

.subckt dut iref inp inn out
XB iref vb3 vb4 Cascode_Bias_LV
XA vb3 vb4 inn out inp Opamp_2stg_LV
.ends dut
