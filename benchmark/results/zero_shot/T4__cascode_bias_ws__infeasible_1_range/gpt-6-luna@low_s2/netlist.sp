.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and sink mirror
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS reference branch: NMOS mirror current pulls the diode-connected
* PMOS branch current; the PMOS mirror sources current at out.
XMNPREF nref iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPREF nref nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPOUT out nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Bias outputs are provided as unloaded copies of the available mirror biases.
RVB1 vb1 nref 1
RVB2 vb2 nref 1
RVB3 vb3 iin 1
RVB4 vb4 iin 1
.ends dut
