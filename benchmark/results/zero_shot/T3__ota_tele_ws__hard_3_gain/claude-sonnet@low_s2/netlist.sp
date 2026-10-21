.subckt dut iref inp inn out
* bias mirror
XMb iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
XMl out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=6
* input pair
XM1 a inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 b inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* mirror load
XM3 a a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XM4 b a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* second stage
XM5 out b vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=6
* compensation
Rz b cz 1k
Cc cz out 1.5p
.ends dut
