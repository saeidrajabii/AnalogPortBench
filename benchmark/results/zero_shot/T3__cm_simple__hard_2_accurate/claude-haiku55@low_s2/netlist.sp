.subckt dut in out
* Reference branch: M1 diode-connected bottom device, M3 diode-connected cascode
XM1 n1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM3 in in n1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Output branch: M2 mirror bottom device, M4 cascode (gate tied to in)
XM2 x n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM4 out in x 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
.ends dut
