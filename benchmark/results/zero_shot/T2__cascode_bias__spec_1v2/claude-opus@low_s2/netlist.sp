.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS wide-swing reference: vb4 = iin (Sooch-style self-biased cascode)
XNC iin vb3 x1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XN1 x1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS reference branch: NMOS cascode sink -> self-biased PMOS cascode (vb1)
XNB1 x2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNB2 vb1 vb3 x2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XPC vb1 vb2 y1 vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XP1 y1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
* vb2 generation: weak PMOS diode fed by NMOS cascode sink
XNC1 x3 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNC2 vb2 vb3 x3 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XPW vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* vb3 generation: weak NMOS diode fed by PMOS cascode source
XPD1 y2 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XPD2 vb3 vb2 y2 vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XNW vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
* Output cascode sink and source
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
.ends dut
