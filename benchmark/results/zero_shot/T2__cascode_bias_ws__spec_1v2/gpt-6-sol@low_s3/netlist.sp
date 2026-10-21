.subckt dut iin out vb1 vb2 vb3 vb4
* Reference current enters a diode-connected NMOS.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
RVB4 iin vb4 1

* An NMOS mirror supplies the PMOS reference branch.
XNBIAS vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1

* Cascode-gate biases.
RP2 vdd vb2 560k
RP0 vb2 0 440k
RN3 vdd vb3 350k
RN0 vb3 0 650k

* Cascoded output current source and sink.
XPS psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XPC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1
XNS nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XNC out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
.ends dut
