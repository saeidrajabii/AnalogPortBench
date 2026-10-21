.subckt dut iin out vb1 vb2 vb3 vb4
* reference branch: Iin -> NMOS cascode -> NMOS (gate tied to iin)
XNRc iin vb3 nr 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XNRb nr iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
R4 iin vb4 1
* vb1 branch: PMOS wide-swing self-biased diode, fed by cascoded NMOS sink
XP1a pa vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XP1c vb1 vb2 pa vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XN1c vb1 vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XN1b n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* vb2 branch: small PMOS diode, fed by cascoded NMOS sink
XP2d vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1
XN2c vb2 vb3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XN2b n2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* vb3 branch: small NMOS diode, fed by cascoded PMOS source
XP3a p3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XP3c vb3 vb2 p3 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XN3d vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=1 nf=1 m=1
* output cascode source and sink
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
.ends dut
