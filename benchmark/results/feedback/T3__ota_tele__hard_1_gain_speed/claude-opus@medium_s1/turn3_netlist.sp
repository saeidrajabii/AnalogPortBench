.subckt dut iref inp inn out
* ---------------- bias ----------------
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=4
* NMOS cascode bias: x ~ Ib*Rs ~ 0.36 V
Rt vdd vcn 78k
XMBC vcn vcn sn 0 sky130_fd_pr__nfet_01v8_lvt W=13.33 L=0.7 nf=1 m=1
Rs sn 0 72k
Cvn vcn 0 2p
* PMOS cascode bias: y ~ VDD - Ib*Rp ~ 0.95 V
Rp vdd sp 50k
XMBP vcp vcp sp vdd sky130_fd_pr__pfet_01v8_lvt W=13.33 L=1 nf=1 m=1
Rb vcp 0 70k
Cvp vcp vdd 2p
* ---------------- stage 1 ----------------
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=6
XM1 x1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XM2 x2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.7 nf=1 m=1
XM4 o1 vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.7 nf=1 m=1
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XM6 o1 vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.7 nf=1 m=2
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.7 nf=1 m=2
* ---------------- stage 2 ----------------
XM9 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=12
XM10 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=2 nf=1 m=12
* ---------------- compensation ----------------
Rz o1 nz 1.5k
Cc nz out 0.8p
.ends dut
