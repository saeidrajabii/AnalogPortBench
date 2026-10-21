.subckt dut iin out vb1 vb2 vb3 vb4
* Reference: iin is tied to the diode-connected NMOS gate node vb4 through a 1 mohm short
Rshort iin vb4 1m
XMNref vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* NMOS cascode current sink (mirror of Iref, cascode gate vb3)
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* vb1 generator: PMOS diode sourced by an NMOS replica sink carrying Iref
XMPb1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMNb1 vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* PMOS cascode current source (bottom gate vb1, cascode gate vb2)
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* vb2 and vb3 set by ideal resistor dividers (outputs are unloaded in the test)
Rvb2t vdd vb2 110k
Rvb2b vb2 0 100k
Rvb3t vdd vb3 85k
Rvb3b vb3 0 100k
.ends dut
