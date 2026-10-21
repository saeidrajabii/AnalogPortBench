.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and sink mirror (vb4 = Vgs of iin diode, about 0.55 V at 20 uA)
XMN4 iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMNb nsrc iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
Rvb4 vb4 iin 1m
* NMOS cascode sink; gate vb3 set by diode-connected device fed from VDD through R
XMNc out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
Rb3 vdd vb3 26k
XMNd vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.84 L=0.5 nf=1 m=1
* PMOS bottom source; gate vb1 set by diode-connected PMOS fed to ground through R
XMPd vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
Rb1 vb1 0 30k
XMPb psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
* PMOS cascode source; gate vb2 tied low through a small resistor
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
Rb2 vb2 0 1
.ends dut
