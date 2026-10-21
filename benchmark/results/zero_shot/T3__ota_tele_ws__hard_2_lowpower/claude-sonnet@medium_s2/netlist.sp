.subckt dut iref inp inn out
* bias mirror
XMb iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMs out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=2
* first stage: NMOS pair, PMOS mirror load
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=3 nf=1 m=1
XM2 o1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=3 nf=1 m=1
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=3 nf=1 m=1
XM4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=3 nf=1 m=1
* second stage
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=4
* Miller compensation
Rz o1 nz 2k
Cc nz out 1p
.ends dut
