* Bias generator: iref diode sets the NMOS sink gate (Vbias_4);
* resistor dividers set the NMOS cascode gate (Vbias_3) and PMOS cascode gate (Vbias_2).
.subckt Cascode_Bias_WS Iin Vbias_2 Vbias_3 Vbias_4
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
Rb Iin Vbias_4 1m
Rv1 vdd Vbias_3 100k
Rv2 Vbias_3 0 300k
Rp1 vdd Vbias_2 380k
Rp2 Vbias_2 0 100k
.ends Cascode_Bias_WS

* Folded-cascode OTA: NMOS input pair, PMOS folded current sources,
* PMOS cascodes, NMOS cascode sinks and tail.
.subckt OTA_Folded_Cascode Vbias_2 Vbias_3 Vbias_4 vm vout vp
* Input pair
XMN2 net010 vp net08 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.3 nf=1 m=1
XMN1 net016 vm net08 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.3 nf=1 m=1
* Tail current source (~26 uA)
XMNT net08 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.6 L=0.5 nf=1 m=1
* Left NMOS cascode sink (~10 uA) and its current source
XMN6 net1 Vbias_3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMN7 net018 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* Right NMOS cascode sink (~10 uA) and its current source
XMN9 vout Vbias_3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMN8 net017 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* PMOS folded current sources, gated by the left fold node net1
XMP1 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP2 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS cascodes
XMP4 net1 Vbias_2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP5 vout Vbias_2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
.ends OTA_Folded_Cascode

.subckt dut iref inp inn out
XI0 iref vb2 vb3 vb4 Cascode_Bias_WS
XI1 vb2 vb3 vb4 inn out inp OTA_Folded_Cascode
.ends dut
