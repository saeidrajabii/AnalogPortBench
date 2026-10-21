.subckt Cascode_Bias_SKY Iin Vbias_1 Vbias_2 Vbias_3
* Iin = iref: diode-connected reference, 20 uA. Its gate voltage is Vbias_4 = Iin.
XMref Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Vbias_1: PMOS gate bias (PMOS diode carrying 20 uA, fed by an NMOS mirror of Iin)
XMx1 Vbias_1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMpd Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=41 L=0.5 nf=1 m=1
* Vbias_2: PMOS cascode gate, set by a 20 uA PMOS source into an NMOS diode
XMs2 Vbias_2 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=41 L=0.5 nf=1 m=1
XMb2 Vbias_2 Vbias_2 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Vbias_3: NMOS cascode gate, set by a 20 uA PMOS source into an NMOS diode
XMs3 Vbias_3 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=41 L=0.5 nf=1 m=1
XMb3 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
.ends Cascode_Bias_SKY

.subckt OTA_Folded_Cascode Vbias_1 Vbias_2 Vbias_3 Vbias_4 vm vout vp
* NMOS input pair, about 15 uA per side, low overdrive
XMN1 net016 vm net08 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN2 net010 vp net08 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Tail current source, about 30 uA
XMNt net08 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.5 nf=1 m=1
* PMOS folding current sources, gate Vbias_1, about 35 uA each
XMP0 net010 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=2
XMP2 net016 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=2
* PMOS cascodes, about 20 uA each
XMP4 net1 Vbias_2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=41 L=0.5 nf=1 m=1
XMP5 vout Vbias_2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=41 L=0.5 nf=1 m=1
* Bottom sink for the fold node net1, about 20 uA, with NMOS cascode
XMN6 net1 Vbias_3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN7 net018 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Output sink, about 20 uA, with NMOS cascode
XMN9 vout Vbias_3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN8 net017 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends OTA_Folded_Cascode

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 Cascode_Bias_SKY
XI1 vb1 vb2 vb3 iref inn out inp OTA_Folded_Cascode
.ends dut
