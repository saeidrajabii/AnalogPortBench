.subckt dut iref inp inn out
* bias: diode-connected mirror, 20uA reference
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
* tail current source (~30uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3
* cascode bias branch (~10uA): narrow PMOS diode
XMP pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMD pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1 nf=1 m=1
* input pair
XM1 n8 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XM2 n9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
* PMOS mirror load
XM3 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=21.4 L=0.5 nf=1 m=1
XM4 n8 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=21.4 L=0.5 nf=1 m=1
* cascoded second stage (~70uA)
XM5 d2 n8 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XM7 out pb d2 vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.5 nf=1 m=1
XM8 out pb s2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM6 s2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=7
* Miller compensation with nulling resistor
RZ n8 nz 1.7k
CC nz out 0.4p
.ends dut
