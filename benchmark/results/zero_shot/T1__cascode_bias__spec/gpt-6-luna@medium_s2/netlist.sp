.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current NMOS diode and bias mirrors
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS cascode-bias ladder, sunk by an NMOS mirror
XMPB1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPB0 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNSINK vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* NMOS cascode-bias ladder, fed by a PMOS mirror
XMPBC vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=19 L=1 nf=1 m=1
XMNC vb3 vb3 nx 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNL nx vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* NMOS cascode current sink
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS cascode current source
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
