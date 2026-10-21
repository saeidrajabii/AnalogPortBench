.subckt Cascode_Bias_WS Iin Vb3 Vbp Vpa
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMPA Vpa Vpa vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.4 nf=1 m=1
XMNA Vpa Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
RB1 vdd Vbp 70k
XMNB Vbp Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
XMPD Vb3 Vpa vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.4 nf=1 m=1
RB3 Vb3 0 70k
.ends Cascode_Bias_WS

.subckt Opamp_2stg Vb3 Vb4 Vbp Vpa vm vout vp
XMN3 tail Vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=5
XM1 fb vp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XM2 fa vm tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMPSA fa Vpa vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.4 nf=1 m=1
XMPSB fb Vpa vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.4 nf=1 m=1
XMPCA d1 Vbp fa vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.4 nf=1 m=1
XMPCB o1 Vbp fb vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.4 nf=1 m=1
XMNK1 d1 d1 s1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNM1 s1 s1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNK0 o1 d1 s0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNM0 s0 s1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP2 vout o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XMN5 vout Vb3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=5
XMN4 net1 Vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=5
CC0 net012 vout 600f
RR0 o1 net012 2.2k
.ends Opamp_2stg

.subckt dut iref inp inn out
XI0 iref vb3 vbp vpa Cascode_Bias_WS
XI1 vb3 iref vbp vpa inn out inp Opamp_2stg
.ends dut
