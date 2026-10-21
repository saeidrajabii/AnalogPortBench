.subckt dut iref inp inn out
* ---------------- bias ----------------
* iref -> R1 -> diode NMOS ; V(iref) = Vgs + 0.24 V serves as NMOS cascode bias
R1    iref nbn 12k
XMB   nbn nbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=4
* PMOS bias branch (5 uA): vbp = PMOS diode, vbpc = vbp - 0.35 V
XMBN  vbpc nbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
R2    vbp vbpc 70k
XMPD  vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* ---------------- stage 1: folded cascode ----------------
XMT   tail nbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=6
XM1   f1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=3
XM2   f2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=3
XMF1  f1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=8
XMF2  f2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=8
XMPC1 n1 vbpc f1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPC2 n2 vbpc f2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNC1 n1 iref x1 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=10
XMNC2 n2 iref x2 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=10
XMB1  x1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=5
XMB2  x2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=5
* ---------------- stage 2: cascoded NMOS CS, PMOS current-source load ----------------
XM6   y n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=36
XM7   out iref y 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=24
XM8   out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=24
* ---------------- indirect (cascode-node) compensation ----------------
CC    out x2 0.3p
.ends dut
