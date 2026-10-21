.subckt dut in out
* Input branch: Iref -> in (cascode gate bias) -> R -> a (mirror gate) -> M3 -> x -> M1
R1  in a 14k
XM3 a  in x 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM1 x  a  0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* Output branch
XM4 out in y 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 y   a 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
