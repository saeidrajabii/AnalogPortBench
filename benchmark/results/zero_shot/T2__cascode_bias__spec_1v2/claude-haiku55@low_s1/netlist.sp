.subckt cascode_bias iin vb1 vb2 vb3 vb4
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN0 net4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN2 vb2 vb3 net4 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.5 nf=1 m=1
XMP0 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.5 nf=1 m=1
RR0 iin vb3 1
.ends cascode_bias

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 cascode_bias
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=0.5 nf=1 m=1
.ends dut
