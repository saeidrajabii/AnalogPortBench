.subckt Cascode_Bias_WS Iin Vbias_2
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.36 nf=1 m=1
XMN12 Vbias_2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.36 nf=1 m=1
XMP4 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=4 nf=1 m=1
.ends Cascode_Bias_WS

.subckt OTA_Telescopic VCM Vbias_2 Vbias_4 vm vout vp
XMNT net8 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=20
XMN1 net074 vp net8 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=5
XMN3 net030 vm net8 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=5
XMN0 net082 Vbias5 net074 0 sky130_fd_pr__nfet_01v8_lvt W=1.875 L=0.5 nf=1 m=5
XMN2 vout Vbias5 net030 0 sky130_fd_pr__nfet_01v8_lvt W=1.875 L=0.5 nf=1 m=5
XMP0 net0100 net082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.375 L=0.5 nf=1 m=5
XMP2 net097 net082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.375 L=0.5 nf=1 m=5
XMP1 net082 Vbias_2 net0100 vdd sky130_fd_pr__pfet_01v8_lvt W=3.375 L=0.5 nf=1 m=5
XMP3 vout Vbias_2 net097 vdd sky130_fd_pr__pfet_01v8_lvt W=3.375 L=0.5 nf=1 m=5
Rb5 vdd Vbias5 94k
XMN11 Vbias5 Vbias5 net015 0 sky130_fd_pr__nfet_01v8_lvt W=1.875 L=0.5 nf=1 m=1
XMN8 net015 VCM net014 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=1
XMN10 net014 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.35 L=0.36 nf=1 m=2
.ends OTA_Telescopic

.subckt dut iref inp inn out
XI0 iref vb2 Cascode_Bias_WS
Rcm1 vdd vcmref 5meg
Rcm2 vcmref 0 5meg
XI1 vcmref vb2 iref inn out inp OTA_Telescopic
.ends dut
