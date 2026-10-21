.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current NMOS diode and mirrored cascode bias.
XMREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMLOW nref iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMCAS vb3 vb3 nref nref sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMVB4 vb4 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* PMOS diode stack and matched output cascode.
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XPCAS vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XPNREF vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* Output current sink and source.
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
.ends dut
