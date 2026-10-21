.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference: the input current sets the diode-connected mirror reference.
RR0 iin vb3 1
XNREF vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=1

* PMOS reference branch, loaded by an NMOS mirror of the input current.
XNMIR vb1 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=1
XPMREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=5 nf=1 m=1

* Output current sink and source.
XNSINK out vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=1
XPSOURCE out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=5 nf=1 m=1

* Provide the duplicated bias outputs without loading the reference nodes.
RVB12 vb1 vb2 1
RVB34 vb3 vb4 1
.ends dut
