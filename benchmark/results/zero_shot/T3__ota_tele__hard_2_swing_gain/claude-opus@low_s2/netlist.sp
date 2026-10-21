.subckt dut iref inp inn out
* bias: iref diode and mirrors
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* input pair
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 o1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS mirror load
XM3 x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM4 o1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* second stage
XM6 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=4
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=2
* Miller compensation with nulling resistor
Rz o1 nz 2k
Cc nz out 1.2p
.ends dut
