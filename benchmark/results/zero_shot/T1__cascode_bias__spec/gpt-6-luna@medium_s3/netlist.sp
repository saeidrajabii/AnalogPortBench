.subckt dut iin out vb1 vb2 vb3 vb4
RIN iin vb4 1

* Reference NMOS diode and PMOS bias mirror
XREFN  vb4  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=24 L=2 nf=1 m=1
XREFP  vb1  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=48 L=2 nf=1 m=1
XNMIR  vb1  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=24 L=2 nf=1 m=1

* PMOS cascode-bias replica
XPDIO  vb2  vb2  vb1  vdd  sky130_fd_pr__pfet_01v8_lvt W=48 L=2 nf=1 m=1
XNSINK vb2  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=24 L=2 nf=1 m=1

* NMOS cascode-bias replica
XPSRC  vb3  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=48 L=2 nf=1 m=1
XNLOW  nx   vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=24 L=2 nf=1 m=1
XNDIO  vb3  vb3  nx   0    sky130_fd_pr__nfet_01v8_lvt W=24 L=2 nf=1 m=1

* Cascode current sink
XMN0   nsrc vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=24 L=2 nf=1 m=1
XMN2   out  vb3  nsrc 0    sky130_fd_pr__nfet_01v8_lvt W=24 L=2 nf=1 m=1

* Cascode current source
XMP1   psrc vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=48 L=2 nf=1 m=1
XMP0   out  vb2  psrc vdd  sky130_fd_pr__pfet_01v8_lvt W=48 L=2 nf=1 m=1
.ends dut
