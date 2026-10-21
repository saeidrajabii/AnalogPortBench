* Wide-swing cascode current source/sink, SKY130 (VDD = 1.2 V), rev 3
.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS low-voltage cascode reference (Iin -> R1 -> drain of MN9)
Rtie iin vb3 1
R1   iin vb4 5k
XMN9  vb4 vb3 n10 n10 sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=40
XMN10 n10 vb4 0   0   sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=40
* ---- NMOS cascode copy setting the PMOS reference current
XMN11 n11 vb4 0   0   sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=40
XMN12 vb2 vb3 n11 n11 sky130_fd_pr__nfet_01v8_lvt W=7 L=1 nf=1 m=40
* ---- PMOS low-voltage cascode reference
R2   vb1 vb2 5k
XMP2 vb1 vb2 n13 n13 sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=96
XMP3 n13 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=96
* ---- Output cascode sink (trimmed -0.43 %) and source (trimmed +0.31 %)
XMN0 nsrc vb4 0    0    sky130_fd_pr__nfet_01v8_lvt W=6.97 L=1 nf=1 m=40
XMN2 out  vb3 nsrc nsrc sky130_fd_pr__nfet_01v8_lvt W=6.97 L=1 nf=1 m=40
XMP1 psrc vb1 vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8.025 L=1 nf=1 m=96
XMP0 out  vb2 psrc psrc sky130_fd_pr__pfet_01v8_lvt W=8.025 L=1 nf=1 m=96
.ends dut
