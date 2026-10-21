.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* reference mirror (20uA diode -> 10uA branches)
XMN4  Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=8
XMN6  net1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
XMN7  net2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
XMN12 Vbias_2 Vbias_2 net1 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
XMN11 Vbias_1 Vbias_1 net2 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
* PMOS cascode bias (weak diode) and self-cascoded source bias
XMP4  Vbias_2 Vbias_2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.8 L=1.6 nf=1 m=1
XMP3  net13 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.8 nf=1 m=2
XMP2  Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=2
* PMOS branches feeding NMOS wide-swing bias
XMP7  net5 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.8 nf=1 m=2
XMP6  Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=2
XMP11 net6 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.8 nf=1 m=2
XMP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=2
* NMOS wide-swing cascode bias
XMN8  Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
XMN9  Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
XMN10 net10 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=4
.ends Cascode_Bias_WS

.subckt OTA_Telescopic VCM Vbias_2 Vbias_3 Vbias_4 vm vout vp
* PMOS cascode mirror load
XMP0 net0100 net082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.8 nf=1 m=6
XMP1 net082 Vbias_2 net0100 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=6
XMP2 net097 net082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.8 nf=1 m=6
XMP3 vout Vbias_2 net097 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=6
* NMOS cascodes
XMN0 net082 Vbias5 net074 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=6
XMN2 vout Vbias5 net030 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=6
* input pair
XMN1 net074 vp net8 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=0.8 nf=1 m=6
XMN3 net030 vm net8 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=0.8 nf=1 m=6
* cascoded tail (60uA)
XMN4 net8 Vbias_3 net012 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=24
XMN5 net012 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=24
* replica branch generating NMOS cascode gate Vbias5 (5uA, density matched)
XMP4 net016 Vbias5 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XMP5 Vbias5 Vbias_2 net016 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN11 Vbias5 Vbias5 net015 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMN8 net015 VCM net014 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=0.8 nf=1 m=1
XMN9 net014 Vbias_3 net017 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=2
XMN10 net017 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=2
.ends OTA_Telescopic

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_WS
Rcm1 vdd vcmref 5meg
Rcm2 vcmref 0 5meg
XI1 vcmref vb2 vb3 vb4 inn out inp OTA_Telescopic
.ends dut
