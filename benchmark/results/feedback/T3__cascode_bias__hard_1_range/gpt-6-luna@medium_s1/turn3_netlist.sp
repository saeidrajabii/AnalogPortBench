.subckt dut iin out vb1 vb2 vb3 vb4
* Reference NMOS diode sets the input-current mirror bias.
RR0 iin vb3 1
XNREF vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=1

* PMOS reference branch is loaded by an NMOS mirror of the reference current.
XNMIR vb1 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=1
XPMREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=5 nf=1 m=1

* Output current mirror branches.
XNSINK out vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=1
XPSOURCE out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=5 nf=1 m=1

* Duplicate the bias voltages at the specified output ports.
RVB12 vb1 vb2 1m
RVB34 vb3 vb4 1m
.ends dut
