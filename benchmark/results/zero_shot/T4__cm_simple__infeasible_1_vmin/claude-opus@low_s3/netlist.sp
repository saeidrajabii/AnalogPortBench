.subckt dut in out
* Iref enters node in, drops IR across R to node g (bottom-device gates)
R1 in g 7.5k
* reference branch: cascode M3 (gate = in), bottom M1 (gate = g)
XM3 g in x 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM1 x g 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* output branch
XM4 out in y 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 y g 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
