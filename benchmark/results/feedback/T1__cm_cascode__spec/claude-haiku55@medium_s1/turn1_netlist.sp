.subckt dut in out
* Reference branch: diode-connected cascode device (gate and drain tied to in),
* stacked on a diode-connected device at n1. Mirrored current is set by the n1 gate voltage.
XMRC in in n1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XM1 n1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* Output branch: mirror device (gate at n1) with cascode device (gate at vbo)
XMOUT x n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMC out vbo x 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* Cascode gate bias: resistor from vdd into a small diode-connected device
R1 vdd vbo 100k
XMB vbo vbo 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=0.6 nf=1 m=1
.ends dut
