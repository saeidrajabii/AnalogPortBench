.subckt dut iin out vb1 vb2 vb3 vb4
* Bias generator: 20 uA reference enters iin through a 1-ohm resistor into the diode-connected cascode NMOS.
RR0 iin vb3 1
XMN3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN0 net4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN2 vb2 vb3 net4 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMP1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMP0 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1

* Output stage: NMOS cascode sink and PMOS cascode source meeting at out.
XMN0o nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN2o out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMP1o psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMP0o out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
.ends dut
