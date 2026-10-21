* SKY130 port of the cascode current mirror (hand-sized, not ngspice-verified)
* Reference: 20 uA into iin, mirrored to a cascode NMOS sink and a cascode PMOS source.
.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS bias: iin diode sets reference, MNs copies it into vb1 sink ----
XMNr iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XMNs vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
* ---- PMOS bias: diode MPd carries the copied current, mirrors to vb4 and vb3 branches ----
XMPd vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.5 nf=1 m=1
XMPr vb4 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.5 nf=1 m=1
XMPr2 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.5 nf=1 m=1
* ---- Bias diodes: vb4 = NMOS sink gate, vb3 = NMOS cascode gate ----
XMNd vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XMNc vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.4 L=0.5 nf=1 m=1
* ---- vb2 (PMOS cascode gate): resistor from vdd sets current into NMOS diode ----
R1 vdd vb2 37k
XMNe vb2 vb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
* ---- Output NMOS cascode sink ----
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
* ---- Output PMOS cascode source ----
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.5 nf=1 m=1
.ends dut
