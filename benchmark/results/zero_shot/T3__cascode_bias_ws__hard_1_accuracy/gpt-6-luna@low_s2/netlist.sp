.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference mirror: the reference current enters the drain/gate node.
XMNR iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=5 nf=1 m=1
XMNS out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=5 nf=1 m=1

* PMOS reference branch is driven by the NMOS reference mirror.
XMPR vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=5 nf=1 m=1
XMPRB vbp iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=5 nf=1 m=1
XMPS out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=5 nf=1 m=1

* Bias outputs expose the mirror gate voltages.
.ends dut
