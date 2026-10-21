.subckt dut iin out vb1 vb2 vb3 vb4
* Reference sink and a mirrored copy of the reference current.
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMNCPY npr iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1

* PMOS reference and bias devices.
XMPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1
XMPBIAS vb2 vb1 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1
XMPFEED npr vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1

* NMOS cascode bias stack.
XMNBIAS1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMNBIAS2 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1

* PMOS cascode output branch.
XMP0 nps vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1
XMP1 out vb2 nps vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1

* NMOS cascode output branch.
XMN0 nns vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMN1 out vb3 nns 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
.ends dut
