.subckt dut iin out vb1 vb2 vb3 vb4
* Input-current reference and NMOS cascode-bias stack
XNREF  vb4  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=500 L=5 nf=1 m=1
XNLOW  nx   vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=500 L=5 nf=1 m=1
XNU    vb3  vb3  nx   0    sky130_fd_pr__nfet_01v8_lvt W=500 L=5 nf=1 m=1
XPNB   vb3  vb2  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=1250 L=5 nf=1 m=1

* PMOS cascode-bias stack and its NMOS current sink
XPL    vb1  vb1  vb2  vdd  sky130_fd_pr__pfet_01v8_lvt W=1250 L=5 nf=1 m=1
XPU    vb2  vb2  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=1250 L=5 nf=1 m=1
XNPS   vb1  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=500 L=5 nf=1 m=1

* Cascode output sink and source
XMN0   nsrc vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=500 L=5 nf=1 m=1
XMN2   out  vb3  nsrc 0    sky130_fd_pr__nfet_01v8_lvt W=500 L=5 nf=1 m=1
XMP1   psrc vb2  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=1250 L=5 nf=1 m=1
XMP0   out  vb1  psrc vdd  sky130_fd_pr__pfet_01v8_lvt W=1250 L=5 nf=1 m=1
.ends dut
