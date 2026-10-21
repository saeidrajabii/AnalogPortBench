* ---------------------------------------------------------------
* Bias generator: Iref 20uA -> three 10uA branches
*   Vbias_1 : PMOS current-source gate (cascoded diode)
*   Vbias_2 : PMOS cascode gate (low W/L diode MP4)
*   Vbias_3 : NMOS cascode gate (low W/L diode MN8)
* ---------------------------------------------------------------
.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3
XMN4  Iin     Iin     0    0   sky130_fd_pr__nfet_01v8_lvt W=5    L=1   nf=1 m=2
XMN6  nb1     Iin     0    0   sky130_fd_pr__nfet_01v8_lvt W=5    L=1   nf=1 m=1
XMN7  nb2     Iin     0    0   sky130_fd_pr__nfet_01v8_lvt W=5    L=1   nf=1 m=1
XMN12 Vbias_2 Vbias_2 nb1  0   sky130_fd_pr__nfet_01v8_lvt W=5    L=0.5 nf=1 m=1
XMN11 Vbias_1 Vbias_1 nb2  0   sky130_fd_pr__nfet_01v8_lvt W=5    L=0.5 nf=1 m=1
XMP4  Vbias_2 Vbias_2 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=1.25 L=1   nf=1 m=1
XMP3  nb13    Vbias_1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8    L=1   nf=1 m=1
XMP2  Vbias_1 Vbias_2 nb13 vdd sky130_fd_pr__pfet_01v8_lvt W=10   L=0.5 nf=1 m=1
XMP7  nb5     Vbias_1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8    L=1   nf=1 m=1
XMP6  Vbias_3 Vbias_2 nb5  vdd sky130_fd_pr__pfet_01v8_lvt W=10   L=0.5 nf=1 m=1
XMN8  Vbias_3 Vbias_3 0    0   sky130_fd_pr__nfet_01v8_lvt W=1    L=2   nf=1 m=1
.ends Cascode_Bias_WS

* ---------------------------------------------------------------
* NMOS-input folded-cascode OTA
*   tail 60uA, PMOS sources 60uA each, NMOS wide-swing cascode mirror 30uA each
* ---------------------------------------------------------------
.subckt OTA_Folded_Cascode Vbias_1 Vbias_2 Vbias_3 ibias vm vout vp
XMN3 tail ibias   0    0   sky130_fd_pr__nfet_01v8_lvt W=5  L=1   nf=1 m=6
XMN2 f1   vp      tail 0   sky130_fd_pr__nfet_01v8_lvt W=30 L=1   nf=1 m=1
XMN1 f2   vm      tail 0   sky130_fd_pr__nfet_01v8_lvt W=30 L=1   nf=1 m=1
XMP0 f1   Vbias_1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8  L=1   nf=1 m=6
XMP1 f2   Vbias_1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8  L=1   nf=1 m=6
XMP4 net1 Vbias_2 f1   vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=3
XMP5 vout Vbias_2 f2   vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=3
XMN6 net1 Vbias_3 s1   0   sky130_fd_pr__nfet_01v8_lvt W=5  L=0.5 nf=1 m=3
XMN9 vout Vbias_3 s2   0   sky130_fd_pr__nfet_01v8_lvt W=5  L=0.5 nf=1 m=3
XMN7 s1   net1    0    0   sky130_fd_pr__nfet_01v8_lvt W=3  L=1   nf=1 m=3
XMN8 s2   net1    0    0   sky130_fd_pr__nfet_01v8_lvt W=3  L=1   nf=1 m=3
.ends OTA_Folded_Cascode

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 Cascode_Bias_WS
XI1 vb1 vb2 vb3 iref inn out inp OTA_Folded_Cascode
.ends dut
