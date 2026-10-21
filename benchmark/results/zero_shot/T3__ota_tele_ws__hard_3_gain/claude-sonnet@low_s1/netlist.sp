.subckt dut iref inp inn out
* bias mirror
XMb iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3
XMl out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=6
* input pair (inp -> out is non-inverting)
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS mirror load
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XM4 n2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* second stage
XM5 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=4
* compensation
Rz n2 nz 700
Cc nz out 2p
.ends dut
