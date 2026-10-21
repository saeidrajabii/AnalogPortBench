.subckt Bias iref vb3 vb4
XMNB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNM pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMPD pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPM vb3 pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNC vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.5 L=1 nf=1 m=1
.ends Bias

.subckt Opamp vb3 vb4 vm vout vp
XMT net10 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
XMN1 net08 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN2 net9 vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP2 vout net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=7
XMN5 vout vb3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=7
XMN4 net1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=7
RZ net08 nz 2k
CC nz vout 0.5p
.ends Opamp

.subckt dut iref inp inn out
XI0 iref vb3 iref Bias
XI1 vb3 iref inn out inp Opamp
.ends dut
