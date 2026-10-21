* Bias generator
*   Iin     : 20 uA reference into diode XMN4 (gate drive for tail)
*   Vbias_1 : gate bias for top PMOS sources and the 2nd-stage PMOS load
*   Vbias_2 : PMOS cascode gate (top PMOS Vds = 10uA*27k = 0.27 V)
*   Vbias_3 : NMOS cascode gate (sink Vds = 10uA*18k = 0.18 V)
.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3
XMN4  Iin     Iin     0   0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMNA  Vbias_1 Iin     0   0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPA  Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16.7 L=1 nf=1 m=1
Cb1   Vbias_1 vdd     5p
XMNB  Vbias_2 Iin     0   0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
RB    vdd     nB      27k
XMPB  Vbias_2 Vbias_2 nB  vdd sky130_fd_pr__pfet_01v8_lvt W=15.3 L=0.5 nf=1 m=1
RC    vdd     nC      27k
XMPC  Vbias_3 Vbias_2 nC  vdd sky130_fd_pr__pfet_01v8_lvt W=15.3 L=0.5 nf=1 m=1
XMNC  Vbias_3 Vbias_3 nD  0   sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
RD    nD      0       18k
.ends Cascode_Bias_WS

* Two-stage OTA: folded-cascode first stage + NMOS common-source second stage
.subckt OTA_Folded_Cascode Vbias_1 Vbias_2 Vbias_3 Vbias_4 vm vout vp
* ---- stage 1 ----
* tail (30 uA)
XMT   ntail  Vbias_4 0      0   sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
* input pair (15 uA each); vm on mirror side, vp on output side (stage 2 inverts)
XM2   nl     vm      ntail  0   sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM1   nr     vp      ntail  0   sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* top PMOS sources (30 uA each)
XMPTL nl     Vbias_1 vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=1
XMPTR nr     Vbias_1 vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=1
* PMOS cascodes (15 uA each)
XMPCL nm     Vbias_2 nl     vdd sky130_fd_pr__pfet_01v8_lvt W=23 L=0.5 nf=1 m=1
XMPCR o1     Vbias_2 nr     vdd sky130_fd_pr__pfet_01v8_lvt W=23 L=0.5 nf=1 m=1
* NMOS cascodes
XMNCL nm     Vbias_3 sl     0   sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XMNCR o1     Vbias_3 sr     0   sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
* NMOS mirror sinks
XMNSL sl     nm      0      0   sky130_fd_pr__nfet_01v8_lvt W=11 L=0.5 nf=1 m=1
XMNSR sr     nm      0      0   sky130_fd_pr__nfet_01v8_lvt W=11 L=0.5 nf=1 m=1
* ---- stage 2 (160 uA) ----
XM6   vout   o1      0      0   sky130_fd_pr__nfet_01v8_lvt W=117 L=0.5 nf=1 m=1
XM7   vout   Vbias_1 vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=267 L=1 nf=1 m=1
* ---- Miller compensation with nulling resistor ----
Rz    o1     nz      1.2k
Cc    nz     vout    0.75p
.ends OTA_Folded_Cascode

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 Cascode_Bias_WS
XI1 vb1 vb2 vb3 iref inn out inp OTA_Folded_Cascode
.ends dut
