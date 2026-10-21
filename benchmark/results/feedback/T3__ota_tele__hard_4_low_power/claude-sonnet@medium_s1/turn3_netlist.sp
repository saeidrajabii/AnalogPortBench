.subckt dut iref inp inn out
* bias mirror (20uA ref)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=4
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=2
XMS  out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
* input pair
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS mirror load
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XM4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
* second stage
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=76.8 L=1 nf=1 m=1
* Miller compensation
RZ o1 cz 7k
CC cz out 0.9p
.ends dut
