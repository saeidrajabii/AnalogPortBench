.subckt dut iin out vb1 vb2 vb3 vb4
* Iin drives a diode-connected NMOS reference; the PMOS reference branch
* is supplied by an NMOS mirror, so Iin does not flow into a transistor source.
XMREFN  vb4  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1
XMNREF  vb1  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1
XMPREF  vb1  vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=4000 L=10 nf=1 m=1

* Output current mirror branches
XMNSINK out  vb4  0    0    sky130_fd_pr__nfet_01v8_lvt W=2000 L=10 nf=1 m=1
XMPSOURCE out vb1  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=4000 L=10 nf=1 m=1

* Provide the additional bias outputs as copies of the corresponding biases.
RVB2 vb2 vb1 1m
RVB3 vb3 vb4 1m
.ends dut
