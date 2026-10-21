.subckt dut iref inp inn out
* reference diode and tail
XN0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* input pair
XN1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.3 nf=1 m=1
XN2 d2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.3 nf=1 m=1
* nmos cascodes
XN3 pc1 vb3 d1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XN4 out vb3 d2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
* pmos cascode mirror load
XP1 pc1 vbp pm1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XP2 out vbp pm2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XP3 pm1 pc1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XP4 pm2 pc1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* pmos cascode bias branch (20uA)
XPm3 nS nS vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10.7 L=0.5 nf=1 m=1
XPc3 vbp vbp nS vdd sky130_fd_pr__pfet_01v8_lvt W=10.7 L=0.5 nf=1 m=1
XNd3 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* nmos cascode bias branch (20uA)
XPb1 vb3 nS vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10.7 L=0.5 nf=1 m=1
XNc4 vb3 vb3 s4 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=1
XNd4 s4 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
.ends dut
