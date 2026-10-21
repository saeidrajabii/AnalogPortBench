.subckt dut iin out vb1 vb2 vb3 vb4
* reference diode, vb4 = iin node
XMA iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
Rtie iin vb4 1m
* mirror to pmos diode -> vb1
XMB vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XMPA vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
* pmos cascode bias: vb2 = vdd - I*R - Vsg
R2 vdd q 7.5k
XMPD vb2 vb2 q vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMC vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
* nmos cascode bias: vb3 = Vgs + I*R
XMPE vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMNE vb3 vb3 r 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
R1 r 0 7.5k
* output cascodes
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
.ends dut
