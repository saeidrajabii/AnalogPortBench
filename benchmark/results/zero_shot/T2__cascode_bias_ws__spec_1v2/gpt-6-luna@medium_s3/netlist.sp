.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and mirror supplying the PMOS bias branch
XMNREF  iin  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMNBIA  vb1  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1

* PMOS reference; its current is set by the NMOS mirror
XMPREF  vb1  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1

* Cascode output branches
XMP1    psrc vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XMP0    out  vb2  psrc vdd  sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XMN2    out  vb3  nsrc 0    sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMN0    nsrc vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1

* Bias nodes and connection from the reference node to the NMOS mirror gate
RVB2T   vdd  vb2  6Meg
RVB2B   vb2  0    6Meg
RVB3T   vdd  vb3  6Meg
RVB3B   vb3  0    6Meg
RTIE    iin  vb4  1m
.ends dut
