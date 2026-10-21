.subckt dut iref inp inn out
* bias mirror
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1 nf=1 m=1
XMS  out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=84 L=1 nf=1 m=1
* input pair (inn on diode side, inp on output side)
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS mirror load
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XM4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
* second stage
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=1 nf=1 m=4
* compensation
RZ o1 nz 1.2k
CC nz out 1.5p
.ends dut
