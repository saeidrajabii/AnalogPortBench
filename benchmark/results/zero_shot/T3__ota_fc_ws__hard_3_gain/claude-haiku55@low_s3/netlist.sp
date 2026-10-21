* Bias network for 1.2 V SKY130 port (ideal 20 uA into iref).
* Vbias_4 = iref diode (NMOS sink gate), Vbias_2 = PMOS gate (diode-referenced),
* Vbias_3 = NMOS cascode gate (set by PMOS copy vs. NMOS diode).
.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* Reference diode: Vbias_4 = iref node
XMR Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* NMOS copy (60 uA) sinking from Vbias_2
XMS1 Vbias_2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* PMOS diode sourcing into Vbias_2
XMPD Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
* PMOS copy into Vbias_3 and NMOS diode sinking from Vbias_3
XMPC Vbias_3 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
XMND Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* Vbias_1 not used by the OTA; tie to Vbias_2 to avoid a floating port
XMTIE Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
.ends Cascode_Bias_WS

* Folded-cascode OTA, NMOS input pair, ported to SKY130 LVT.
.subckt OTA_Folded_Cascode Vbias_2 Vbias_3 Vbias_4 vm vout vp
* NMOS sinks / cascodes
XMN6 net1 Vbias_3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN0 net08 Vbias_3 net020 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN2 net010 vp net08 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN9 vout Vbias_3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN1 net016 vm net08 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN8 net017 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMN4 net019 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMN3 net020 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMN5 net08 Vbias_3 net019 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN7 net018 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* PMOS cascodes and top sources
XMP4 net1 Vbias_2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP5 vout Vbias_2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP1 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP3 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP2 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP0 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends OTA_Folded_Cascode

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_WS
XI1 vb2 vb3 vb4 inn out inp OTA_Folded_Cascode
.ends dut
