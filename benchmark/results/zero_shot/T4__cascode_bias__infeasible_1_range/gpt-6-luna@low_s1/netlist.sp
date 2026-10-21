.subckt dut iin out vb1 vb2 vb3 vb4
* PMOS reference and cascode bias
XMPREF iin iin vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMPBIAS vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Mirrored current establishes the NMOS reference and cascode bias
XMPNREF vb4 iin vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMNCAS vb3 vb3 vb4 vb4 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Output cascode current source and sink
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
