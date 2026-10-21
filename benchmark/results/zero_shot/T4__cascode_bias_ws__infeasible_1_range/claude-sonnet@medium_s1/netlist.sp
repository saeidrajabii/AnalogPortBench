.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference mirror (vb4 = iin)
XMNa iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* vb1: PMOS diode, sunk by mirror
XMPa vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XMNq vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* vb2: PMOS cascode bias (resistor from vdd sets cascode source headroom)
R2 vdd ps2 5.5k
XMPc vb2 vb2 ps2 vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XMNp vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* vb3: NMOS cascode bias
XMPe vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XMNc vb3 vb3 nx 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
R3 nx 0 5.5k
* vb4 is the iin node
Rvb4 vb4 iin 1
* Output stage
XMN0 nsrc iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=1
.ends dut
