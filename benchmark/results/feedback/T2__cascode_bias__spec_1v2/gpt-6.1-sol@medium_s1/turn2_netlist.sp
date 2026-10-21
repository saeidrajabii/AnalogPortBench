.subckt dut iin out vb1 vb2 vb3 vb4

RIN iin vb3 1
RNBIAS vb3 vb4 8k
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=100

XNBIAS nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=100
XNCBIAS vb2 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=100
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=4 nf=1 m=300
RPBIAS vb1 vb2 8k

XNOUT nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=100
XNCOUT out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=100

XPOUT psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=4 nf=1 m=300
XPCOUT out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=4 nf=1 m=300

.ends dut
