.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* Convert the reference current into a gate voltage for NMOS current sinks.
XMREFP Iin Iin vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPBIAS nbias Iin vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMREFN nbias nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Output-stage sink bias and differential-pair tail bias.
XMOUTBIAS Vbias_4 nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=5
XMTail Vbias_3 nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2

* PMOS mirror bias for the differential-pair active load.
XMPLOADREF Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPLOADBIAS Vbias_2 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends Cascode_Bias_WS

.subckt Opamp_2stg Vbias_3 Vbias_4 vm vout vp
* Differential input pair and PMOS current-mirror load.
XMNINP nplus vp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNINM nminus vm ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNTail ntail Vbias_3 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
XMPDIODE nplus nplus vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPMIRROR nminus nplus vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Second gain stage.
XMNOUT vout Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=5
XMPOUT vout nminus vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=5

* Miller compensation.
RR0 nminus ncomp 1k
CC0 ncomp vout 500f
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb1 vb2 vb3 vb4 Cascode_Bias_WS
XI1 vb3 vb4 inn out inp Opamp_2stg
.ends dut
