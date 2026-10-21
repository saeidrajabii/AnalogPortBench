.subckt dut iref inp inn out
* ---------------- bias ----------------
R1    iref nbn 12k
XMB   nbn nbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=4
XMBN  vbpc nbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
R2    vbp vbpc 70k
XMPD  vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* ---------------- stage 1: degenerated NMOS pair, folded cascode ----------------
XMT   tail nbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=6
XM1   f1 inn s1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=3
XM2   f2 inp s2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=3
RS1   s1 tail 2k
RS2   s2 tail 2k
XMF1  f1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=10
XMF2  f2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=10
XMPC1 n1 vbpc f1 vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.5 nf=1 m=1
XMPC2 n2 vbpc f2 vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.5 nf=1 m=1
XMNC1 n1 iref x1 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=14
XMNC2 n2 iref x2 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=14
XMB1  x1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=7
XMB2  x2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=7
* ---------------- stage 2: cascoded NMOS CS, PMOS current-source load ----------------
XM6   y n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.25 nf=1 m=20
XM7   out iref y 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=27
XM8   out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=27
* ---------------- indirect (cascode-node) compensation ----------------
CC    out x2 0.18p
.ends dut
