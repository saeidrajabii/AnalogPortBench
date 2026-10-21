.subckt dut iin out vb1 vb2 vb3 vb4
* Bias generator: stacked diodes. The cascode diodes (MN3, MP0) use m=4,
* so their |VGS| is smaller. This lowers vb3 and raises vb2 for more swing at out.
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=4
RR0 iin vb3 1
XMN0B n4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN2B vb2 vb3 n4 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMP0 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=4
* Output cascode sink and source
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP1O psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMP0O out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=4
.ends dut
