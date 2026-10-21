* Bias generator
* - Iin: the 20 uA reference flows into the drain of diode XMN4.
*   That diode's gate/drain node is the gate bias for the NMOS current sinks.
* - Vbias_2: PMOS cascode gate. XMPB matches the cascode current density,
*   and the 25k resistor sets the top PMOS Vds to 10uA*25k = 0.25 V.
* - Vbias_3: NMOS cascode gate. XMNC matches the cascode current density,
*   and the 14k resistor sets the NMOS sink Vds to 10uA*14k = 0.14 V.
.subckt Cascode_Bias_WS Iin Vbias_2 Vbias_3
XMN4  Iin     Iin     0   0   sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMNB  Vbias_2 Iin     0   0   sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1
RB    vdd     nB      25k
XMPB  Vbias_2 Vbias_2 nB  vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.7 nf=1 m=1
RC    vdd     nC      25k
XMPC  Vbias_3 Vbias_2 nC  vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.7 nf=1 m=1
XMNC  Vbias_3 Vbias_3 nD  0   sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
RD    nD      0       14k
.ends Cascode_Bias_WS

* Folded-cascode OTA: NMOS input pair, self-biased PMOS cascode mirror load
.subckt OTA_Folded_Cascode Vbias_2 Vbias_3 Vbias_4 vm vout vp
* tail (60 uA)
XMT   ntail  Vbias_4 0      0   sky130_fd_pr__nfet_01v8_lvt W=90 L=1 nf=1 m=1
* input pair (30 uA each); vp on the mirror side, vm on the output side
XM2   nl     vp      ntail  0   sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XM1   nr     vm      ntail  0   sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1
* top PMOS sources (60 uA each), gates on the self-biased node net1
XMPTL nl     net1    vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=44 L=0.6 nf=1 m=1
XMPTR nr     net1    vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=44 L=0.6 nf=1 m=1
* PMOS cascodes (30 uA each)
XMPCL net1   Vbias_2 nl     vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.7 nf=1 m=1
XMPCR vout   Vbias_2 nr     vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.7 nf=1 m=1
* NMOS cascodes
XMNCL net1   Vbias_3 sl     0   sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMNCR vout   Vbias_3 sr     0   sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
* NMOS sinks (30 uA each)
XMNSL sl     Vbias_4 0      0   sky130_fd_pr__nfet_01v8_lvt W=45 L=1 nf=1 m=1
XMNSR sr     Vbias_4 0      0   sky130_fd_pr__nfet_01v8_lvt W=45 L=1 nf=1 m=1
.ends OTA_Folded_Cascode

.subckt dut iref inp inn out
XI0 iref vb2 vb3 Cascode_Bias_WS
XI1 vb2 vb3 iref inn out inp OTA_Folded_Cascode
.ends dut
