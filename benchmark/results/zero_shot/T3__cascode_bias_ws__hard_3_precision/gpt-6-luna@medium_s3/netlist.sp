.subckt dut iin out vb1 vb2 vb3 vb4
* Long-channel matched mirrors; vb2 and vb4 are tied to their reference biases.
RVB1 vb1 vb2 1m
RVB3 vb3 vb4 1m

* NMOS reference and mirrored branch that biases the PMOS mirror.
XMNREF  iin  iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=10000 L=100 nf=1 m=1
XMNPMR  nref iin  0    0    sky130_fd_pr__nfet_01v8_lvt W=10000 L=100 nf=1 m=1

* PMOS reference and output current source.
XMPREF  nref vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20000 L=100 nf=1 m=1
XMP_OUT out  vb2  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20000 L=100 nf=1 m=1

* NMOS output current sink.
XMN_OUT out  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=10000 L=100 nf=1 m=1
.ends dut
