.subckt dut in out
* Cascode bias resistor: I*R is about 0.2 V at 20 uA
R1 in nb 10k
* Reference branch
XMC1 nb in x1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM1  x1 nb 0  0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Output branch
XMC2 out in x2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2  x2  nb 0  0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
