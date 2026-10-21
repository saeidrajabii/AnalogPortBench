.subckt dut iref inp inn out
* bias
Xb0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
Xb2 vbp vbp_dummy 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=0
Xb3 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
Xpa vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.5 nf=1 m=1
Xpb vbn vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.5 nf=1 m=1
Xnd vbn vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* tail
Xt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* input pair
Xm1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.3 nf=1 m=1
Xm2 n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.3 nf=1 m=1
* nmos cascodes
Xc1 d1 vbn n1 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.3 nf=1 m=1
Xc2 out vbn n2 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.3 nf=1 m=1
* pmos cascodes
Xp1 d1 vbp s1 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
Xp2 out vbp s2 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* pmos mirror
Xp3 s1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
Xp4 s2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
.ends dut
