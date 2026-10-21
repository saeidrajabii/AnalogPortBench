* Wide-swing cascode current source/sink, ported to SKY130 (VDD = 1.2 V)
.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS reference: Iin flows through R1 into a self-biased low-voltage cascode
* vb3 = vb4 + Iin*R1, so the bottom device Vds is about Iin*R1 (~0.12 V)
Rtie iin vb3 1
R1   iin vb4 7k
XMN9  vb4 vb3 n10 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=20
XMN10 n10 vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=20
* ---- NMOS cascode copy that sets the PMOS reference current
XMN11 n11 vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=20
XMN12 vb2 vb3 n11 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=20
* ---- PMOS reference: mirror-image low-voltage cascode, vb2 = vb1 - I*R2
R2   vb1 vb2 7k
XMP2 vb1 vb2 n13 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=48
XMP3 n13 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=48
* ---- Output: NMOS cascode sink and PMOS cascode source meeting at out
XMN0 nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=20
XMN2 out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=7 L=0.5 nf=1 m=20
XMP1 psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=48
XMP0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=48
.ends dut
