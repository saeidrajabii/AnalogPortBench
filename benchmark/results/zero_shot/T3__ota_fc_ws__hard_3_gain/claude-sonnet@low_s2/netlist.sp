.subckt dut iref inp inn out
* reference / bias
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMB2 vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMPD vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
XMPS vb3 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
XMND vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* tail
XMT net08 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* input pair
XMN2 n10 inp net08 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN1 n16 inn net08 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS current sources
XMP0 n10 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP1 n10 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP2 n16 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP3 n16 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* PMOS cascodes
XMP4 net1 vb2 n10 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP5 out vb2 n16 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* NMOS cascodes
XMN6 net1 vb3 n18 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMN9 out vb3 n17 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* NMOS current sinks
XMN7 n18 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMN8 n17 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
.ends dut
