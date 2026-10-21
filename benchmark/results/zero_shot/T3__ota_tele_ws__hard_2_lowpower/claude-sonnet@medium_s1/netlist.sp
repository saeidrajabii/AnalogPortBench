.subckt dut iref inp inn out
* bias mirror
XM0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* input pair
XM1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XM2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
* PMOS mirror load
XM3 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XM4 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* second stage
XM6 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=4
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
* Miller compensation
Rz n2 nz 1.5k
Cc nz out 1.2p
.ends dut
