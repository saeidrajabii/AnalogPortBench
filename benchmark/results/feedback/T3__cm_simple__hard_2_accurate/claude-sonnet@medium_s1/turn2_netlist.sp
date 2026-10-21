.subckt dut in out
* reference voltage 0.12 V
RR1 vdd vr 900k
RR2 vr 0 100k
* amplifier bias
XPB nb nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
RB nb 0 140k
XT1 t1 nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=2
XT2 t2 nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=2
* amp1: holds in at vr by driving g
XP1a d1 in t1 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XP1b g vr t1 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XN1a d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XN1b g d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
* amp2: holds n2 at vr by driving cascode gate gc
XP2a e1 vr t2 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XP2b gc n2 t2 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XN2a e1 e1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XN2b gc e1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
* mirror
XMA in g 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XMB n2 g 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XMC2 out gc n2 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
.ends dut
