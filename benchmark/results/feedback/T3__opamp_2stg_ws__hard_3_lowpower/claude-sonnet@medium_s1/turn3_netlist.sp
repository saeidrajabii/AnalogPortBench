.subckt dut iref inp inn out
* bias: iref diode and mirror
XMB4 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMC1 nc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMC2 vb3 vb3 nc 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
RB vdd vb3 30k
* pmos cascode bias
XMC3 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
RBP vdd vbp 110k
* first stage
XMT3 n12 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=38 L=1 nf=1 m=1
XMT0 n10 vb3 n12 0 sky130_fd_pr__nfet_01v8_lvt W=38 L=1 nf=1 m=1
XM1 n08 inp n10 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.8 nf=1 m=1
XM2 n9 inn n10 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.8 nf=1 m=1
XMP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.7 nf=1 m=1
XMP0 n08 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.7 nf=1 m=1
* second stage
XMP2 s2 n08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.4 nf=1 m=1
XMP3 out vbp s2 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XMN4 n1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=76 L=1 nf=1 m=1
XMN5 out vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=76 L=1 nf=1 m=1
* compensation
RR0 n08 n012 1k
CC0 n012 out 0.6p
.ends dut
