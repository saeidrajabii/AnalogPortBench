.subckt dut iref inp inn out
* reference diode and mirrors (unit: W=2 L=0.5 -> ~5uA)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=4
* bias branch A: PMOS diode (vbp)
XMa vbp vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
XMpd vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* bias branch B: vb3
XMpb vb3 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMnc vb3 vb3 nd 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMnd nd vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
* bias branch C: vb2
XMpe pe vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMpc vb2 vb2 pe vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMne vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
* vb4 is the mirror gate (diode node = iref)
Rb vb4 iref 1
* OTA
XMt tail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=10
XM1 n016 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.3 nf=1 m=1
XM2 n010 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.3 nf=1 m=1
XMp0 n010 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XMp3 n016 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XMp4 net1 vb2 n010 vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.4 nf=1 m=1
XMp5 out vb2 n016 vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.4 nf=1 m=1
XMn6 net1 vb3 n018 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMn9 out vb3 n017 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMn7 n018 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=6
XMn8 n017 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=6
.ends dut
