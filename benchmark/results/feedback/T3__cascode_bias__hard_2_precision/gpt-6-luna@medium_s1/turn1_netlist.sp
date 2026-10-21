.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference stack and cascode bias generation
RIN iin vb3 1
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1
XMN3 vb3 vb3 vb4 vb4 sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1

* NMOS cascode sink reference
XMN0 net4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1
XMN2 vb2 vb3 net4 net4 sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1

* PMOS reference stack and cascode bias generation
XMP1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=10 nf=1 m=1
XMP0 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=10 nf=1 m=1

* Output NMOS cascode sink
XMN_OUT0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1
XMN_OUT1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1

* Output PMOS cascode source
XMP_OUT1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=10 nf=1 m=1
XMP_OUT0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=4000 L=10 nf=1 m=1
.ends dut
