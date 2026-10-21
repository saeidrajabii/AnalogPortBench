.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference and output sink mirror
RREF iin vb4 1u
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=10
XNSINK out vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=10
RNB vb3 vb4 1u

* PMOS reference branch and output source mirror
XPMREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=10
XNMREF vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=10
XPSOURCE out vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000 L=10 nf=1 m=10
RPB vb1 vb2 1u
.ends dut
