.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and output current sink
XMNR iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=10 nf=1 m=1
XMNS out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=10 nf=1 m=1

* PMOS reference branch and output current source
XMNSP vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=10 nf=1 m=1
XMPR vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1
XMPS out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=10 nf=1 m=1

* Unloaded bias outputs
RVB2 vb2 vb1 1G
RVB3 vb3 iin 1G
RVB4 vb4 iin 1G
.ends dut
