.subckt dut in out
* Iref flows through R1 into the reference cascode M3/M1.
* The cascode gate bias is Va + Iref*R1, giving about 0.2 V headroom for M1/M2.
R1  in a 10k
XM3 a  in x 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM1 x  a  0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* Output branch: M2 sets the current and M4 cascodes it.
XM2 y  a  0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM4 out in y 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
