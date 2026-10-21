* Ported folded-cascode OTA with cascode bias generator, SKY130 LVT devices.
* Topology and bias mirror ratios follow the TSMC source; widths are rescaled to L = 0.5 um.

.subckt bias_wsk Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
XMN12 Vbias_2 Vbias_2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMN11 Vbias_1 Vbias_1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMN10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMN9 Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMN8 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=3.33 nf=1 m=1
XMN7 net2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMN6 net1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMP11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16.9 L=0.5 nf=1 m=1
XMP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=16.9 L=0.5 nf=1 m=1
XMP7 net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16.9 L=0.5 nf=1 m=1
XMP6 Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=16.9 L=0.5 nf=1 m=1
XMP4 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=4 nf=1 m=1
XMP3 net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16.9 L=0.5 nf=1 m=1
XMP2 Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=16.9 L=0.5 nf=1 m=1
.ends bias_wsk

.subckt ota_fcs Vbias_2 Vbias_3 Vbias_4 vm vout vp
XMN6 net1 Vbias_3 net018 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMN0 net08 Vbias_3 net020 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMN2 net010 vp net08 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN9 vout Vbias_3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMN1 net016 vm net08 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN8 net017 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMN4 net019 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMN3 net020 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMN5 net08 Vbias_3 net019 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMN7 net018 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=9.25 L=0.5 nf=1 m=1
XMP4 net1 Vbias_2 net010 vdd sky130_fd_pr__pfet_01v8_lvt W=16.9 L=0.5 nf=1 m=1
XMP5 vout Vbias_2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=16.9 L=0.5 nf=1 m=1
XMP1 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16.9 L=0.5 nf=1 m=1
XMP3 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16.9 L=0.5 nf=1 m=1
XMP2 net016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16.9 L=0.5 nf=1 m=1
XMP0 net010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16.9 L=0.5 nf=1 m=1
.ends ota_fcs

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 bias_wsk
XI1 vb2 vb3 vb4 inn out inp ota_fcs
.ends dut
