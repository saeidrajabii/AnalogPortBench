.subckt dut iref inp inn out
* bias generation
XMN0  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.4 nf=1 m=2
XMNb1 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.4 nf=1 m=1
XMPd  vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=2
XMPb2 vbcp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=2
XMNy  vbcp vbcp 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.4 nf=1 m=1
XMPb3 vbcn vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=2
XMNx  vbcn vbcn nr 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.4 nf=1 m=1
Rx nr 0 15k
* tail and input pair
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.4 nf=1 m=11
XMiL fl inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XMiR fr inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
* top PMOS current sources
XMtL fl vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=15
XMtR fr vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=15
* PMOS cascodes
XMpL xl vbcp fl vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.35 nf=1 m=1
XMpR out vbcp fr vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.35 nf=1 m=1
* NMOS cascodes
XMcL xl vbcn yl 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.3 nf=1 m=1
XMcR out vbcn yr 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.3 nf=1 m=1
* NMOS mirror
XMmL yl yl 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.4 nf=1 m=1
XMmR yr yl 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.4 nf=1 m=1
.ends dut
