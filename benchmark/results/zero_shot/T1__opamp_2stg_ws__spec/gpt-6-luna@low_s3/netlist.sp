.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* The reference current enters the drain/gate of a diode-connected NMOS.
XMREF Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* NMOS bias outputs: Vbias_3 sets the input-pair tail current;
* Vbias_4 sets the second-stage sink current.
XM3 Vbias_3 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XM4 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2

* PMOS bias for the second-stage load, established by a mirrored
* reference current and a diode-connected PMOS.
XMNBIAS netn Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
XMPD vbiasp vbiasp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMPM vbiasp Iin vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* Unused compatibility outputs.
XMN1 Vbias_1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN2 Vbias_2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends Cascode_Bias_WS

.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
* Differential input stage with PMOS current-mirror load.
XMN1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN2 net09 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMNT net10 Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP1 net08 net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP2 net09 net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Second stage and PMOS active load.
XMN3 net12 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=2
XMP3 net12 vbiasp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XMP4 vout net12 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMN4 vout Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=2

* Miller compensation.
RR0 net12 net012 3k
CC0 net012 vout 500f
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_WS
XI1 vb3 vb4 inn out inp Opamp_2stg
.ends dut
