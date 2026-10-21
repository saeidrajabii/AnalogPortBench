.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference stack: the reference current enters the drain of the
* upper diode-connected device and flows through the lower diode-connected device.
XMNR0 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNR1 vb3 vb3 vb4 vb4 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
RREF iin vb3 1

* NMOS cascode output branch
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMN1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* PMOS diode-connected bias stack and cascode output branch
XMPB0 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMPB1 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP1 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends dut
