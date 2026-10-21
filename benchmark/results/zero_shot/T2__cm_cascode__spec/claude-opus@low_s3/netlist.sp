.subckt dut in out
* bottom mirror pair, gates driven from the input node
XMN1 n1  in 0  0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN0 n2  in 0  0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* cascode pair, gates driven by the vb bias
XMN3 in  vb n1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN2 out vb n2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* cascode bias: resistor feeding a weak, long diode-connected NMOS
Rb   vdd vb 100k
XMB  vb  vb 0  0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=4 nf=1 m=1
.ends dut
