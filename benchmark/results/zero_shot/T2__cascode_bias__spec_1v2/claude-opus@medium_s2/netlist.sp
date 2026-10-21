.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS low-voltage cascode reference (driven by iin) ----
XMN1  x    vb4 0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XMN3  iin  vb3 x    x    sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
R1    iin  vb4 1
* ---- vb2 generation: simple NMOS copy into weak PMOS diode ----
XMN8  vb2  vb4 0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XMPW  vb2  vb2 vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* ---- vb3 generation: PMOS copy (gate vb2) into weak NMOS diode ----
XMP8  vb3  vb2 vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNW  vb3  vb3 0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1.25 nf=1 m=1
* ---- PMOS low-voltage cascode reference, fed by cascoded NMOS copy ----
XMN9  n9   vb4 0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XMN10 vb1  vb3 n9   n9   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XMP1R p1   vb1 vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=8
XMP0R vb1  vb2 p1   p1   sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=8
* ---- Output: NMOS cascode sink and PMOS cascode source ----
XMN0  nsrc vb4 0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XMN2  out  vb3 nsrc nsrc sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XMP1  psrc vb1 vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=8
XMP0  out  vb2 psrc psrc sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=8
.ends dut
