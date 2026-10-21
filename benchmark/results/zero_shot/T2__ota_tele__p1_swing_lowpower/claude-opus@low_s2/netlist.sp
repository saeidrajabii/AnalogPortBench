.subckt dut iref inp inn out
* Bias: NMOS reference diode -> NMOS mirror -> PMOS diode
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB2 pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB3 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* Stage 1: PMOS differential pair, NMOS mirror load
XMT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XM1 d1 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XM2 d2 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XM3 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=2 nf=1 m=1
XM4 d2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=2 nf=1 m=1
* Stage 2: NMOS common source, PMOS current-source load
XM5 out d2 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=2 nf=1 m=6
XM6 out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=3
* Miller compensation with nulling resistor
Rz d2 cz 3k
Cc cz out 1p
.ends dut
