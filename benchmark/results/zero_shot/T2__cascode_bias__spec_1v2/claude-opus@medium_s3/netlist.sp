.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference branch: iin -> R1 -> diode node vb4 (sets vb3 = vb4 + Iref*R1)
R1   iin  vb4  8k
XMN1 nb1  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN3 vb4  iin  nb1  0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* vb3 is the iin node (cascode gate voltage)
Rvb3 iin  vb3  1
* NMOS cascode mirror sinking the reference current out of the PMOS bias branch
XMN0 nb2  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN2 vb2  vb3  nb2  0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS bias branch: diode node vb1, vb2 = vb1 - Iref*R2
XMP1 pb1  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XMP0 vb1  vb2  pb1  pb1  sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
R2   vb1  vb2  7k
* Output NMOS cascode sink
XMN4 nsrc vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN5 out  vb3  nsrc 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* Output PMOS cascode source
XMP2 psrc vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XMP3 out  vb2  psrc psrc sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
.ends dut
