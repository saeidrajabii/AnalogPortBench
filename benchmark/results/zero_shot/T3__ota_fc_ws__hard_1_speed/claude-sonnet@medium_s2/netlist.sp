.subckt dut iref inp inn out
* ---- bias ----
XB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.3 nf=1 m=1
XB1 vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.6 L=0.3 nf=1 m=1
XPA vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.5 L=1.1 nf=1 m=1
XPC vb3 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.5 L=1.1 nf=1 m=1
XB3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=1.6 nf=1 m=1
* ---- folded cascode OTA ----
XT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10.8 L=0.3 nf=1 m=1
XMN2 n10 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.18 nf=1 m=1
XMN1 n16 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.18 nf=1 m=1
XMN7 n18 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.6 L=0.3 nf=1 m=1
XMN8 n17 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.6 L=0.3 nf=1 m=1
XMN6 n1 vb3 n18 0 sky130_fd_pr__nfet_01v8_lvt W=3.6 L=0.3 nf=1 m=1
XMN9 out vb3 n17 0 sky130_fd_pr__nfet_01v8_lvt W=3.6 L=0.3 nf=1 m=1
XMP4 n1 vb2 n10 vdd sky130_fd_pr__pfet_01v8_lvt W=8.4 L=0.35 nf=1 m=1
XMP5 out vb2 n16 vdd sky130_fd_pr__pfet_01v8_lvt W=8.4 L=0.35 nf=1 m=1
XMP0 n10 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10.5 L=0.35 nf=1 m=2
XMP2 n16 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10.5 L=0.35 nf=1 m=2
.ends dut
