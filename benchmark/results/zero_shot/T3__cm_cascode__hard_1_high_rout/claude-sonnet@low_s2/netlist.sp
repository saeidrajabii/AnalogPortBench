.subckt dut in out
* input branch: cascode M3 on diode-connected M1
XM3 in  nb  x   0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM1 x   x   0   0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* output branch: cascode M4 on mirror M2
XM4 out nb  y   0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM2 y   x   0   0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* cascode bias: resistor-fed diode with W/4, giving Vb U2248 Vgs + Vdsat
Rb vdd nb 35k
XMb nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=1 nf=1 m=1
.ends dut
