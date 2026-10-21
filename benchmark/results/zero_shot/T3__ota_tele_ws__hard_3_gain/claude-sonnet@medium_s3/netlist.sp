.subckt dut iref inp inn out
* bias: reference mirror
XB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
XBT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=10
XBN vbn iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XBP vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
Rbn vdd vbn 45k
Rbp vdd vbp 85k
* input pair
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2 d2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* NMOS cascodes
XC1 nm vbn d1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XC2 out vbn d2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS cascodes
XP1 nm vbp p1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XP2 out vbp p2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS mirror
XP3 p1 nm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XP4 p2 nm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
