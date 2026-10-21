.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS diode-connected reference and output sink mirror.
RIN iin vb3 1
XNREF vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1
XNSINK out vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1

* NMOS mirror biases the diode-connected PMOS reference.
XNMIR vb1 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=5 nf=1 m=1
XPSOURCE out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=5 nf=1 m=1

* Bias output ports.
RVB12 vb1 vb2 1k
RVB34 vb3 vb4 1k
.ends dut
