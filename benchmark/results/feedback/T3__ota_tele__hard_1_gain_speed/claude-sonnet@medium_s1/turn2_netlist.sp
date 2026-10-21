.subckt dut iref inp inn out
* bias
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=1 nf=1 m=1
XMB6 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.75 L=1 nf=1 m=1
XMBP vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XMBN vcn vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XMDN vcn vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.7 L=1 nf=1 m=1
XMBQ vcp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XMDQ vcp vcp 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.4 L=1 nf=1 m=1
* tail
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.06 L=1 nf=1 m=2
* input pair
XM1 f1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.6 nf=1 m=1
XM2 f2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.6 nf=1 m=1
* pmos current sources
XMP1 f1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=17.5 L=2 nf=1 m=2
XMP2 f2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=17.5 L=2 nf=1 m=2
* pmos cascodes
XMC1 e1 vcp f1 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XMC2 out vcp f2 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
* nmos cascoded mirror
XMN1C e1 vcn n1 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMN2C out vcn n2 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMN1 n1 e1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMN2 n2 e1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
.ends dut
