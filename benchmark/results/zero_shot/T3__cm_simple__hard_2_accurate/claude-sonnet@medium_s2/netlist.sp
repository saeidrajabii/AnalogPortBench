.subckt dut in out
* input diode and mirror device
XM1 in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM0 n1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* regulated cascode
XM2 out ng n1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM3 ng n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=1 nf=1 m=1
* bias for amplifier (Iref/4)
XM4 pb in 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=1 nf=1 m=1
XP1 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XP2 ng pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
