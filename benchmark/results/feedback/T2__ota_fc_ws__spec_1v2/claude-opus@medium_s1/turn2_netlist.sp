* Bias generator
*   Iin     : 20 uA reference into diode XMN4 (gate drive for the tail)
*   Vbias_1 : fixed gate bias for the top PMOS sources (diode matched in current density)
*   Vbias_2 : PMOS cascode gate; top PMOS Vds = 10uA*20k = 0.20 V
*   Vbias_3 : NMOS cascode gate; sink Vds    = 10uA*13k = 0.13 V
.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3
XMN4  Iin     Iin     0   0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMNA  Vbias_1 Iin     0   0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPA  Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=33.3 L=2 nf=1 m=1
XMNB  Vbias_2 Iin     0   0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
RB    vdd     nB      20k
XMPB  Vbias_2 Vbias_2 nB  vdd sky130_fd_pr__pfet_01v8_lvt W=21.3 L=0.7 nf=1 m=1
RC    vdd     nC      20k
XMPC  Vbias_3 Vbias_2 nC  vdd sky130_fd_pr__pfet_01v8_lvt W=21.3 L=0.7 nf=1 m=1
XMNC  Vbias_3 Vbias_3 nD  0   sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
RD    nD      0       13k
.ends Cascode_Bias_WS

* Folded-cascode OTA: NMOS input pair, fixed-bias PMOS sources,
* low-voltage NMOS cascode mirror load
.subckt OTA_Folded_Cascode Vbias_1 Vbias_2 Vbias_3 Vbias_4 vm vout vp
* tail (60 uA)
XMT   ntail  Vbias_4 0      0   sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1
* input pair (30 uA each); vp on the mirror side, vm on the output side
XM2   nl     vp      ntail  0   sky130_fd_pr__nfet_01v8_lvt W=150 L=1.5 nf=1 m=1
XM1   nr     vm      ntail  0   sky130_fd_pr__nfet_01v8_lvt W=150 L=1.5 nf=1 m=1
* top PMOS sources (60 uA each), fixed bias
XMPTL nl     Vbias_1 vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=2 nf=1 m=1
XMPTR nr     Vbias_1 vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=2 nf=1 m=1
* PMOS cascodes (30 uA each)
XMPCL nm     Vbias_2 nl     vdd sky130_fd_pr__pfet_01v8_lvt W=64 L=0.7 nf=1 m=1
XMPCR vout   Vbias_2 nr     vdd sky130_fd_pr__pfet_01v8_lvt W=64 L=0.7 nf=1 m=1
* NMOS cascodes
XMNCL nm     Vbias_3 sl     0   sky130_fd_pr__nfet_01v8_lvt W=90 L=1.5 nf=1 m=1
XMNCR vout   Vbias_3 sr     0   sky130_fd_pr__nfet_01v8_lvt W=90 L=1.5 nf=1 m=1
* NMOS mirror sinks (gates on self-biased node nm)
XMNSL sl     nm      0      0   sky130_fd_pr__nfet_01v8_lvt W=45 L=1 nf=1 m=1
XMNSR sr     nm      0      0   sky130_fd_pr__nfet_01v8_lvt W=45 L=1 nf=1 m=1
.ends OTA_Folded_Cascode

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 Cascode_Bias_WS
XI1 vb1 vb2 vb3 iref inn out inp OTA_Folded_Cascode
.ends dut
