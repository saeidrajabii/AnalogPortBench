.subckt dut iref inp inn out
* bias: diode-connected reference
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5.6 L=0.8 nf=1 m=1
* tail
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5.6 L=0.8 nf=1 m=3
* input pair (inn -> net9 side, inp -> net08 side)
XMN2 net9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XMN1 net08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1
* mirror load
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=1
* second stage
XMP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.8 nf=1 m=6
XMS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5.6 L=0.8 nf=1 m=9
* compensation
RR0 net08 net012 600
CC0 net012 out 0.7p
.ends dut
