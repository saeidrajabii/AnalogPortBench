.subckt dut iref inp inn out
* bias
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XB2 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XPD vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
XPS vcn vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
XNC vcn vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=1 nf=1 m=1
* tail
XT ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
* input pair
XM1 d1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM3 d2 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* nmos cascodes
XM0 n082 vcn d1 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM2 out vcn d2 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* pmos cascode mirror
XP1 n082 vcp p1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XP3 out vcp p2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XP0 p1 n082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XP2 p2 n082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
.ends dut
