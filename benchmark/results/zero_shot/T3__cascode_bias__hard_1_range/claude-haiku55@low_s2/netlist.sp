.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS reference / cascode bias (reference current enters at iin) ----
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMN3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
RR0 iin vb3 1

* ---- PMOS bias for vb1 (diode PMOS from vdd, sunk by NMOS mirror of Iref) ----
XMNs vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMPr vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* ---- PMOS bias for vb2 (narrow diode PMOS gives Vsg ~0.7 V, vb2 ~0.5 V) ----
XMNd vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMPd vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.5 L=1 nf=1 m=1

* ---- NMOS cascode sink to ground ----
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* ---- PMOS cascode source from vdd ----
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends dut
