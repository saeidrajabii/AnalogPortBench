.subckt dut iref inp inn out
* bias
XB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XT  t iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XB1 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XBP vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
Rn1 vdd vcn 200k
Rn2 vcn 0 280k
Rp1 vdd vcp 280k
Rp2 vcp 0 200k
* input pair
XM1 fl inp t 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=0.8 nf=1 m=1
XM2 fr inn t 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=0.8 nf=1 m=1
* pmos current sources
XPS1 fl vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1.5 nf=1 m=1
XPS2 fr vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1.5 nf=1 m=1
* pmos cascodes
XP3 vl vcp fl vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XP4 out vcp fr vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
* nmos cascodes
XC1 vl vcn ml 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XC2 out vcn mr 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
* nmos wide-swing mirror
XN1 ml vl 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XN2 mr vl 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
.ends dut
