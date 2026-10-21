.subckt Cascode_Bias iin vb1 vb2 vb3 vb4
* NMOS cascode diode stack
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
RR0 iin vb3 1
* branch A: sets vb1 (PMOS diode)
XMN0a na vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN2a vb1 vb3 na 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMPa vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=4
* branch B: sets vb2 (diode with source resistor)
XMN0b nb vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN2b vb2 vb3 nb 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
RS vdd sb 7.5k
XMPb vb2 vb2 sb vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=4
.ends Cascode_Bias

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=4
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=4
.ends dut
