.subckt dut in out
* Reference branch: M1 diode-connected bottom device, M2 cascode (gate g4)
XM1 a a 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 in g4 a 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Output branch: M3 bottom mirror (gate a), M4 cascode (gate g4)
XM3 b a 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM4 out g4 b 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Cascode bias generator: resistor from vdd into diode-connected M5
R1 vdd g4 10k
XM5 g4 g4 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=0.5 nf=1 m=1
.ends dut
