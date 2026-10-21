.subckt dut iref inp inn out
* bias
XB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XT  t iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XB1 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XBP vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1.5 nf=1 m=1
Rn1 vdd vcn 140k
Rn2 vcn 0 170k
Rp1 vdd vcp 280k
Rp2 vcp 0 200k
* input pair
XM1 fl inp t 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XM2 fr inn t 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
* pmos current sources
XPS1 fl vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=27 L=1.5 nf=1 m=1
XPS2 fr vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=27 L=1.5 nf=1 m=1
* pmos cascodes
XP3 vl vcp fl vdd sky130_fd_pr__pfet_01v8_lvt W=27 L=1.5 nf=1 m=1
XP4 out vcp fr vdd sky130_fd_pr__pfet_01v8_lvt W=27 L=1.5 nf=1 m=1
* nmos cascodes
XC1 vl vcn ml 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XC2 out vcn mr 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
* nmos wide-swing mirror
XN1 ml vl 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XN2 mr vl 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
.ends dut
