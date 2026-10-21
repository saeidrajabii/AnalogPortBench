.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference diode (sets vb4)
XNa iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=3 nf=1 m=1
* Output NMOS cascode sink
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=3 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=3 nf=1 m=1
* Output PMOS cascode source
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=4 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=4 nf=1 m=1
* vb1 branch: PMOS diode + NMOS replica stack
XPd1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=4 nf=1 m=1
XNm2c vb1 vb3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=3 nf=1 m=1
XNm2 n2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=3 nf=1 m=1
* vb2 branch: small PMOS diode (1/8 W/L) + NMOS replica stack
XPd2 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=4 nf=1 m=1
XNm3c vb2 vb3 n3 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=3 nf=1 m=1
XNm3 n3 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=3 nf=1 m=1
* vb3 branch: PMOS mirror feeds small NMOS diode (1/8 W/L)
XPm vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=4 nf=1 m=1
XNd vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.5 L=3 nf=1 m=1
.ends dut
