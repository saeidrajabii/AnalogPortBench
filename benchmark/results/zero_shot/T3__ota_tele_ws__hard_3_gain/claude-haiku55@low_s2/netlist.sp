.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* Reference diode: 20 uA into Iin
XMREF Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Vbias_4 follows Iin (tail mirror gate) through an ideal 1 mOhm link
Rlink Iin Vbias_4 1m
* Vbias_2: PMOS diode loaded by a 20 uA NMOS sink mirrored from Iin
XMS2 Vbias_2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMD2 Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Vbias_1: PMOS diode loaded by a 20 uA NMOS sink mirrored from Iin
XMS1 Vbias_1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMD1 Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Vbias_3: NMOS diode fed by a PMOS mirror of Vbias_2
XMP3 Vbias_3 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN3 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
.ends Cascode_Bias_WS

.subckt OTA_Telescopic VCM Vbias_2 Vbias_3 Vbias_4 vm vout vp
* Input pair with NMOS cascode and tail
XMN1 net074 vp net8 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN3 net030 vm net8 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN7 net8 Vbias_3 net6 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN6 net6 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* NMOS cascodes
XMN0 net082 Vbias5 net074 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2 vout Vbias5 net030 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS folded load
XMP0 net0100 net082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP1 net082 Vbias_2 net0100 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP2 net097 net082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP3 vout Vbias_2 net097 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Vbias5 generator (CM-controlled NMOS cascode gate)
XMP4 net016 Vbias5 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP5 Vbias5 Vbias_2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN11 Vbias5 Vbias5 net015 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN8 net015 VCM net014 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN9 net014 Vbias_3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN10 net017 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
.ends OTA_Telescopic

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_WS
Rcm1 vdd vcmref 5meg
Rcm2 vcmref 0 5meg
XI1 vcmref vb2 vb3 vb4 inn out inp OTA_Telescopic
.ends dut
