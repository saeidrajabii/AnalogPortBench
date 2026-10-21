.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* 20 uA reference: Iin is diode-connected (drain of MN4 receives the ideal current)
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Vbias_1: PMOS diode (20 uA) with NMOS sink mirrored from Iin
XMP_d1 Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN_s1 Vbias_1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Vbias_2: PMOS cascode gate, PMOS diode with NMOS sink
XMP_d2 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN_s2 Vbias_2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Vbias_3: two stacked NMOS diodes (about 2 Vgs), fed by PMOS mirror from Vbias_1
XMP_s3 Vbias_3 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN_c3a Vbias_3 Vbias_3 bx 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN_c3b bx bx 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Vbias_4: NMOS sink gate, diode fed by PMOS mirror from Vbias_1
XMP_s4 Vbias_4 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN_c4 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
.ends Cascode_Bias_WS

.subckt OTA_Folded_Cascode Vbias_2 Vbias_3 Vbias_4 vm vout vp
* NMOS input pair
XMN2 net010 vp net08 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMN1 net016 vm net08 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* Cascoded tail (two parallel sinks, 20 uA each)
XMN0 net08 Vbias_3 net020 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN5 net08 Vbias_3 net019 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN3 net020 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN4 net019 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Folded NMOS cascodes and sinks
XMN6 net1 Vbias_3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN7 net018 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN9 vout Vbias_3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN8 net017 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* PMOS cascodes and current sources (folded)
XMP4 net1 Vbias_2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP5 vout Vbias_2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP1 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP0 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP3 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP2 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends OTA_Folded_Cascode

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_WS
XI1 vb2 vb3 vb4 inn out inp OTA_Folded_Cascode
.ends dut
