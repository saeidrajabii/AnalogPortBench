.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and cascode-bias stack
RR0 iin vb3 1
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=10
XMN3 vb3 vb3 vb4 vb4 sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=10

* PMOS reference and cascode-bias stack; MN0 mirrors the reference current
XMN0 vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=10
XMP1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=5 nf=1 m=10
XMP0 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=5 nf=1 m=10

* Long-channel output mirrors provide low output-current variation
XMNOUT out vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=10
XMPOUT out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=5 nf=1 m=10
.ends dut
