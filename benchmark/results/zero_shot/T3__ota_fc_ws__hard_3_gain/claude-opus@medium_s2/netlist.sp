.subckt dut iref inp inn out
* ---------------- bias generation ----------------
XMNR  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMNT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=5
XMNS1 vbpd iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPB  vbpd vbpd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPS  vbn vbpd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNBN vbn vbn rn 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
RN    rn 0 90k
XMNS2 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPBP vbp vbp rp vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
RP    vdd rp 44k
* ---------------- stage 1: telescopic cascode ----------------
XMN1  n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMN2  n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMNC  d vbn n1 0 sky130_fd_pr__nfet_01v8_lvt W=12.5 L=0.5 nf=1 m=1
XMND  a vbn n2 0 sky130_fd_pr__nfet_01v8_lvt W=12.5 L=0.5 nf=1 m=1
XMPC  d vbp p1 vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=0.5 nf=1 m=1
XMPD  a vbp p2 vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=0.5 nf=1 m=1
XMPA  p1 d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6.25 L=0.5 nf=1 m=2
XMPM  p2 d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6.25 L=0.5 nf=1 m=2
RAD   a d 8Meg
* ---------------- stage 2 with replica bias ----------------
XM6   out a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6.25 L=0.5 nf=1 m=10
XM7   out g7 0 0 sky130_fd_pr__nfet_01v8_lvt W=12.5 L=2 nf=1 m=10
XM6R  g7 df vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6.25 L=0.5 nf=1 m=1
XM7R  g7 g7 0 0 sky130_fd_pr__nfet_01v8_lvt W=12.5 L=2 nf=1 m=1
RF    d df 1Meg
CF    df vdd 2p
* ---------------- Miller compensation ----------------
RZ    a cz 2.5k
CC    cz out 1.1p
.ends dut
