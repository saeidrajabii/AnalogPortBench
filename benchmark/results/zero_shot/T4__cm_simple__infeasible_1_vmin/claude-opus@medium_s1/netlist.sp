.subckt dut in out
* reference branch: in -> R1 -> x (drain of cascode MC1); MC1 gate at in
R1 in x 8k
XMC1 x in y 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM1  y x 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
* output branch
XMC2 out in z 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2  z x 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
.ends dut
