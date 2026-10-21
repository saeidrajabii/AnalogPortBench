.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference stack and matched cascode-mirror branch.
XNREF0 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=10 nf=1 m=100
XNREF1 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=10 nf=1 m=100
XNBIAS0 nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=10 nf=1 m=100
XNBIAS1 vb2 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=10 nf=1 m=100

* PMOS reference stack.
XPREF0 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=10 nf=1 m=100
XPREF1 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=10 nf=1 m=100

* Output cascodes.
XNOUT0 nsink vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=10 nf=1 m=100
XNOUT1 out vb3 nsink 0 sky130_fd_pr__nfet_01v8_lvt W=39.28 L=10 nf=1 m=100
XPOUT0 psource vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=10 nf=1 m=100
XPOUT1 out vb2 psource vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=10 nf=1 m=100

RIN iin vb3 1
.ends dut
