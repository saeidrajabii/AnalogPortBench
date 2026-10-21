.subckt dut iref inp inn out
* bias mirror (20uA ref)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMS  out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.5 L=1 nf=1 m=1
* input pair
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 o1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS mirror load
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XM4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
* second stage
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=56 L=1 nf=1 m=1
* Miller compensation
RZ o1 cz 6k
CC cz out 0.8p
.ends dut
