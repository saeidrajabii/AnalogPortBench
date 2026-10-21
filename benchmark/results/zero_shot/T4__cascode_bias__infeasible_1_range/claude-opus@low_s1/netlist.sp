.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference (low-voltage cascode, Iref into drain of cascode)
XNR1 nr vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XNR2 iin vb3 nr 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
* vb3 generation: PMOS cascode source -> NMOS diode (W/4)
XP31 p3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=4
XP32 vb3 vb2 p3 vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=4
XN3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* vb1 generation: NMOS cascode sink -> PMOS low-voltage cascode reference
XN11 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XN12 vb1 vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XP12 vb1 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=4
XP11 p1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=4
* vb2 generation: NMOS cascode sink -> PMOS diode (W/4)
XN21 n2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XN22 vb2 vb3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XP2 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
* Output cascode sink and source
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=4
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=4
.ends dut
