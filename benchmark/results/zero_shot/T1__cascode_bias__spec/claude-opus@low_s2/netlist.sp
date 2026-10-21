.subckt dut iin out vb1 vb2 vb3 vb4
* reference diode
R0 iin vb4 1
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* PMOS bias vb1
XMN5 vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
* NMOS cascode bias vb3 (weak diode)
XMP5 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XMN3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=1 nf=1 m=1
* PMOS cascode bias vb2 (weak diode)
XMN6 vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP3 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1 nf=1 m=1
* output cascode sink
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* output cascode source
XMP1o psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XMP0o out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
.ends dut
