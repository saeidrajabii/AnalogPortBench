.subckt ota inp inn o pb
XT  t pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XPA d inp t vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=2
XPB o inn t vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=2
XNA d d 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XNB o d 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
C1 o 0 1p
.ends ota

.subckt dut in out
* bias generation
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
RB pb 0 300k
R1 vdd vb 2.2Meg
R2 vb 0 120k
* reference branch: M1 gate tied to in, cascode M4 regulated so node a = vb
XM1 a in 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=4
XM4 in g1 a 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=4
XA1 vb a g1 pb ota
* output branch: M3 is gain-boosted so node x = vb
XM2 x in 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=4
XM3 out g2 x 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=4
XA2 vb x g2 pb ota
.ends dut
