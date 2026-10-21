.subckt dut iin out vb1 vb2 vb3 vb4
* Reference NMOS and its 1:1 sink mirror
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=10 nf=1 m=50
XMNSRC vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=10 nf=1 m=50
XMNOUT out vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=10 nf=1 m=50

* PMOS reference branch and its 1:1 source mirror
XMPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=10 nf=1 m=150
XMPOUT out vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=10 nf=1 m=150

* Export the corresponding mirror gate biases on all four bias ports
RPTIE vb1 vb2 1u
RNTIE vb3 vb4 1u
.ends dut
