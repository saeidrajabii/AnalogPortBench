.subckt amp2 a b o pb
* first stage: PMOS input pair, NMOS mirror load
XMT  s  pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=2 nf=1 m=2
XMA  d1 a  s   vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
XMB  o1 b  s   vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
XML1 d1 d1 0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XML2 o1 d1 0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* second stage: NMOS common source, PMOS current-source load
XMCS o  o1 0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPL o  pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=2 nf=1 m=1
.ends amp2

.subckt CM_N_rgc in out
* bias generation (~2 uA)
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=2 nf=1 m=1
RB   pb 0 300k
* 0.12 V reference for bottom-device drains
R1 vdd vr 900k
R2 vr  0  100k
* reference branch
XM1 x  in 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
XM3 in g3 x 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XA1 x vr g3 pb amp2
* output branch
XM2 y   in 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=8
XM4 out g4 y 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XA2 y x g4 pb amp2
.ends CM_N_rgc

.subckt dut in out
XI0 in out CM_N_rgc
.ends dut
