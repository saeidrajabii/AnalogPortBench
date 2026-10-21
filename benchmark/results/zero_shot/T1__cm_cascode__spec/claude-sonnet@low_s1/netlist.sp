.subckt dut in out
* reference diode and output mirror (bottom devices)
XMB1 in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB2 n2 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* output cascode
XMC2 out vb n2 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* cascode bias branch (about 10 uA)
R1 vdd vb 120k
XMC3 vb vb n3 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMB3 n3 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
.ends dut
