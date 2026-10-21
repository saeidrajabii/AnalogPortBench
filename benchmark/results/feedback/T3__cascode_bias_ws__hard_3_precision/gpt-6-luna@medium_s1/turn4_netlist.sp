.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and output current sink
XNREF  iin iin 0   0   sky130_fd_pr__nfet_01v8_lvt W=50 L=5 nf=1 m=1
XNOUT  out iin 0   0   sky130_fd_pr__nfet_01v8_lvt W=50 L=5 nf=1 m=1

* PMOS reference branch and output current source
XPMREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=5 nf=1 m=1
XNPMREF vb1 iin 0  0   sky130_fd_pr__nfet_01v8_lvt W=50 L=5 nf=1 m=1
XPOUT  out vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=5 nf=1 m=1

* Unloaded auxiliary bias outputs
RVB2 vb2 vb1 1G
RVB3 vb3 vb1 1G
RVB4 vb4 vb1 1G
.ends dut
