.subckt ota_p inp inn o vb
* PMOS-input diff amp; output o falls when inp rises
XT  t  vb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XA  o  inp t t sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XB  d  inn t t sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XLD d  d  0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XLO o  d  0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
.ends ota_p

.subckt dut in out
* bias for amplifier tails (~5 uA)
XPB vb vb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
RB  vb 0 140k
* drain reference Vx ~ 70 mV
R1  vdd vx 100k
R2  vx 0 6.2k
* input side
XMN1 n1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMN3 in g1 n1 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XA1  n1 vx g1 vb ota_p
* output side
XMN0 n2 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMN2 out g2 n2 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XA2  n2 vx g2 vb ota_p
.ends dut
