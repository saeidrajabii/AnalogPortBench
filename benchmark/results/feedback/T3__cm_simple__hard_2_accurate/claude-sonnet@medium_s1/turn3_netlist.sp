.subckt dut in out
* reference voltage 0.1 V
RR1 vdd vr 1.1M
RR2 vr 0 100k
* amplifier bias
XPB nb nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
RB nb 0 140k
XT1 t1 nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XT2 t2 nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* amp1: holds in at vr by driving g
XP1a d1 in t1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=4 nf=1 m=1
XP1b g vr t1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=4 nf=1 m=1
XN1a d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1
XN1b g d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1
* amp2: holds n2 at vr by driving cascode gate gc
XP2a e1 vr t2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=4 nf=1 m=1
XP2b gc n2 t2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=4 nf=1 m=1
XN2a e1 e1 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1
XN2b gc e1 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=4 nf=1 m=1
* mirror, wide devices in deep weak inversion
XMA in g 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=2 nf=1 m=1
XMB n2 g 0 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=2 nf=1 m=1
XMC2 out gc n2 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.5 nf=1 m=1
.ends dut
