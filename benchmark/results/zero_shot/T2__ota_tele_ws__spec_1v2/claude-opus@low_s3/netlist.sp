.subckt dut iref inp inn out
* Bias: mirror the reference current
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB1 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB2 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* Stage 1: PMOS differential pair, 40uA tail
XMT tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=2
XM1 d1 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM2 o1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM3 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XM4 o1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Stage 2: NMOS common source, 120uA PMOS load
XM5 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=6
XM6 out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=6
* Miller compensation with nulling resistor
Rz o1 nz 1.2k
Cc nz out 1p
.ends dut
