.subckt dut in out
* bias branch for cascode gate (wide-swing cascode)
RB vdd vb 30k
XMB vb vb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* reference side
XM3 in vb g 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM1 g g 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* output side
XM2 d2 g 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM4 out vb d2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
.ends dut
